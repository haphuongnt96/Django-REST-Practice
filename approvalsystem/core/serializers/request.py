from rest_framework import serializers
from django.utils import timezone
from django.db.models import Q, ObjectDoesNotExist
from django.utils.translation import gettext_lazy as _

from core.models import (
    Request, RequestStatus, RequestDetail, Notifier,
    ApprovalRouteDetail, ApprovalPost, ApprovalType
)
from commons.constants import (
    RequestStatus as RequestStatusEnum,
    ApprovalStatus as ApprovalStatusEnum,
)
from .approval_route import ApprovalRouteSerializer, DetailApprovalRouteSerializer
from .m_approval_route import RequestDetailMasterSerializer


class RequestStatusSerializer(serializers.ModelSerializer):
    class Meta:
        model = RequestStatus
        fields = [
            'status_id',
            'status_nm',
        ]


class RequestSerializer(serializers.ModelSerializer):
    approvalroute = ApprovalRouteSerializer(many=True, read_only=True)
    status = RequestStatusSerializer(read_only=True)

    class Meta:
        model = Request
        fields = [
            'request_id',
            'request_title',
            'status',
            'approvalroute',
        ]

    def get_approvalroute(self, instance):
        '''
        新しい承認ルートにソートする
        '''
        status = instance.status.all().order_by('-approval_route_id')


class RequestDetailSerializer(serializers.ModelSerializer):
    request_column_id = serializers.CharField()

    class Meta:
        model = RequestDetail
        fields = [
            'request_column_id',
            'request_column_val',
        ]


class ExtendRequestDetailMasterSerializer(RequestDetailMasterSerializer):
    """
    ExtendRequestDetailMasterSerializer
    in order to get answer request_column_val from t_request_detail
    """
    request_column_val = serializers.CharField(read_only=True)

    class Meta(RequestDetailMasterSerializer.Meta):
        fields = [
            'request_column_id',
            'column_nm',
            'column_type_id',
            'column_type_nm',
            'required',
            'max_length',
            'choices',
            'notes',
            'request_column_val',
            'request_detail_children',
        ]

    def to_representation(self, instance):
        representation = super(ExtendRequestDetailMasterSerializer, self).to_representation(instance)
        if self.context.get('request_instance'):
            request_column_val = RequestDetail.objects.filter(
                request=self.context.get('request_instance'),
                request_column=instance
            ).values_list('request_column_val', flat=True).first()
            representation['request_column_val'] = request_column_val
        return representation


class RegisterApprovalRouteDetailSerializer(serializers.ModelSerializer):
    approval_emp_id = serializers.IntegerField(required=True)
    approval_post_nm = serializers.CharField(required=True, max_length=10)
    order = serializers.IntegerField(required=True)

    class Meta:
        model = ApprovalRouteDetail
        fields = [
            'detail_no',
            'approval_emp_id',
            'approval_post_nm',
            'order',
        ]


class DetailRequestSerializer(serializers.ModelSerializer):
    from .notification import NotifierSerializer

    approval_type_id = serializers.CharField()
    approval_type_nm = serializers.SerializerMethodField(read_only=True)
    request_emp_id = serializers.CharField(read_only=True)
    request_emp_nm = serializers.CharField(read_only=True)
    department_id = serializers.CharField(write_only=True, required=True)
    department_nm = serializers.CharField(read_only=True)
    request_details = RequestDetailSerializer(many=True, write_only=True)
    approval_route_details = RegisterApprovalRouteDetailSerializer(many=True, write_only=True)
    notifiers = NotifierSerializer(many=True)
    approval_routes = DetailApprovalRouteSerializer(many=True, read_only=True)
    m_request_details = ExtendRequestDetailMasterSerializer(
        many=True, read_only=True,
    )
    status_id = serializers.CharField()

    class Meta:
        model = Request
        fields = [
            'request_id',
            'approval_type_id',
            'request_title',
            'approval_type_nm',
            'request_emp_id',
            'request_emp_nm',
            'request_details',
            'approval_routes',
            'm_request_details',
            'created',
            'department_id',
            'department_nm',
            'approval_route_details',
            'notifiers',
            'status_id',
        ]

    def validate_approval_type_id(self, approval_type_id):
        try:
            approval_type = ApprovalType.objects.get(pk=approval_type_id)
        except ObjectDoesNotExist:
            raise serializers.ValidationError(_('"{input}" is not a valid m_approval_type.').format(input=approval_type_id))
        self.context.update({
            'approval_type': approval_type
        })
        return approval_type_id

    def validate_status_id(self, status_id):
        try:
            RequestStatus.objects.get(pk=status_id)
        except ObjectDoesNotExist:
            raise serializers.ValidationError(_('"{input}" is not a valid m_request_status.').format(input=status_id))
        return status_id

    def validate(self, attrs):
        request_details_dict = {
            request_detail['request_column_id']: request_detail['request_column_val']
            for request_detail in attrs['request_details']
        }
        approval_type = self.context['approval_type']
        request_details_errors = {}
        for m_request_detail in approval_type.m_request_details.prefetch_related('choices'):
            errors = []
            request_column_val = request_details_dict.get(m_request_detail.request_column_id, '')
            if attrs['status_id'] == RequestStatusEnum.APPLYING.value and m_request_detail.required and not request_column_val:
                errors.append(_('This field may not be blank.'))
            if len(request_column_val) > m_request_detail.max_length:
                errors.append(_('Ensure this field has no more than {max_length} characters.').format(max_length=m_request_detail.max_length))
            choices = m_request_detail.choices.values_list('choice_id', flat=True).all()
            if choices and request_column_val and request_column_val not in choices:
                errors.append(_('"{input}" is not a valid choice.').format(input=request_column_val))
            if errors:
                request_details_errors[m_request_detail.request_column_id] = errors
        if any(request_details_errors.values()):
            raise serializers.ValidationError({'request_details': request_details_errors})
        return attrs

    def get_approval_type_nm(self, instance):
        return instance.approval_type.approval_type_nm

    @staticmethod
    def create_or_update_request_detail(request_detail: dict):
        request_detail_instance = RequestDetail.objects.update_or_create(
            request_id=request_detail['request_id'],
            request_column_id=request_detail['request_column_id'],
            defaults={
                'request_column_val': request_detail['request_column_val'],
            },
        )
        return request_detail_instance

    def create(self, validated_data):
        """
        Custom create func for create nested serializer.
        """
        request_details = validated_data.pop('request_details', [])
        department_id = validated_data.pop('department_id')
        approval_route_details = validated_data.pop('approval_route_details', [])
        notifiers = validated_data.pop('notifiers', [])

        # create request
        request = Request.objects.create(**validated_data)

        # save request detail answer
        for request_detail in request_details:
            request_detail['request_id'] = request.request_id
            self.create_or_update_request_detail(request_detail)
        request_emp = None
        if self.context.get('request'):
            request_emp = self.context['request'].user

        # remove duplicate approval_emp from approval_route_details
        distinct_approval_emp_ids = set(
            request.approval_type.m_approval_routes.values_list('emp_id', flat=True).distinct()
        )
        register_route_details_data = []
        for approval_route_detail in approval_route_details:
            approval_emp_id = approval_route_detail['approval_emp_id']
            if approval_emp_id in distinct_approval_emp_ids:
                continue
            # get or create approval post by approval_post_nm
            approval_post_nm = approval_route_detail.pop('approval_post_nm')
            approval_post, created = ApprovalPost.objects.get_or_create(
                approval_post_nm=approval_post_nm
            )
            approval_route_detail['approval_post'] = approval_post
            distinct_approval_emp_ids.add(approval_emp_id)
            register_route_details_data.append(approval_route_detail)
        # create approval route and assign approval route details.
        request.register_approval_route(
            request_emp=request_emp,
            department_id=department_id,
            route_details=register_route_details_data,
        )

        # assign notify emp
        for notifier in notifiers:
            notifier['request'] = request
            Notifier.objects.update_or_create(
                **notifier, defaults={}
            )

        return request

    def update(self, instance, validated_data):
        """
        Custom update func for update nested serializer.
        """
        request_details = validated_data.pop('request_details', [])
        approval_route_details = validated_data.pop('approval_route_details', [])
        notifiers = validated_data.pop('notifiers', [])
        status_id = validated_data.pop('status_id')

        # update request
        instance.status_id = status_id
        instance.request_title = validated_data.get('request_title', '')
        # save request detail answer
        for request_detail in request_details:
            request_detail['request_id'] = instance.request_id
            self.create_or_update_request_detail(request_detail)
        instance.modified = timezone.now()
        instance.save()

        # create or update approval route details
        latest_approval_route = instance.approval_routes.order_by('-created').all()[0]
        approval_route_detail_ids = set()
        for approval_route_detail_data in approval_route_details:
            # get or create approval post by approval_post_nm
            approval_post_nm = approval_route_detail_data.pop('approval_post_nm')
            approval_post, created = ApprovalPost.objects.get_or_create(
                approval_post_nm=approval_post_nm
            )
            approval_emp_id = approval_route_detail_data['approval_emp_id']
            order = approval_route_detail_data['order']
            approval_route_detail_data['approval_post'] = approval_post
            approval_route_detail = ApprovalRouteDetail.objects.filter(
                approval_route=latest_approval_route,
                approval_emp_id=approval_emp_id
            ).first()
            if approval_route_detail:
                if approval_route_detail.approval_status_id in (
                        ApprovalStatusEnum.APPROVED.value,
                        ApprovalStatusEnum.REMAND.value,
                ):
                    continue
                approval_route_detail.approval_post = approval_post
                approval_route_detail.order = order
                approval_route_detail.save()
            else:
                approval_route_detail = ApprovalRouteDetail.objects.create(
                    approval_route=latest_approval_route,
                    approval_post=approval_post,
                    approval_emp_id=approval_emp_id,
                    order=order
                )
            approval_route_detail_ids.add(approval_route_detail.detail_no)

        ApprovalRouteDetail.objects.filter(
            Q(approval_route=latest_approval_route),
            Q(default_flg=False),
            ~Q(detail_no__in=approval_route_detail_ids),
        ).delete()

        notify_emp_ids = set()
        for notifier_data in notifiers:
            notifier_data['request'] = instance
            notifier_obj, created = Notifier.objects.update_or_create(
                **notifier_data, defaults={},
            )
            notify_emp_ids.add(notifier_obj.notify_emp_id)

        Notifier.objects.filter(
            Q(request=instance),
            ~Q(notify_emp_id__in=notify_emp_ids),
        ).delete()

        return instance

    def to_representation(self, instance):
        self.context.update({
            'request_instance': instance
        })
        representation = super(DetailRequestSerializer, self).to_representation(instance)
        if representation['approval_routes']:
            approval_route = representation['approval_routes'][0]
            representation.update(approval_route)
        return representation
