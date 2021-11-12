from rest_framework import serializers
from django.utils import timezone

from core.models import (
    Request, RequestStatus, RequestDetail, NotificationRecord,
    ApprovalRouteDetail, ApprovalPost,
)
from users.models import EmpAffiliation
from .approval_route import ApprovalRouteSerializer, DetailApprovalRouteSerializer
from .m_approval_route import RequestDetailMasterSerializer
from .notification import DetailNotificationRecordSerializer


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
    approval_route_id = serializers.IntegerField()
    approval_emp_id = serializers.IntegerField(required=True)
    approval_post_nm = serializers.CharField(required=True)
    order = serializers.IntegerField(required=True)

    class Meta:
        model = ApprovalRouteDetail
        fields = [
            'approval_emp_id',
            'approval_post_nm',
            'order'
        ]


class DetailRequestSerializer(serializers.ModelSerializer):
    approval_type_id = serializers.CharField()
    approval_type_nm = serializers.SerializerMethodField(read_only=True)
    request_emp_id = serializers.CharField(read_only=True)
    request_emp_nm = serializers.CharField(read_only=True)
    department_id = serializers.CharField(write_only=True, required=True)
    department_nm = serializers.CharField(read_only=True)
    request_details = RequestDetailSerializer(many=True, write_only=True)
    approval_route_details = RegisterApprovalRouteDetailSerializer(many=True, write_only=True)
    notification_records = DetailNotificationRecordSerializer(many=True)
    approval_routes = DetailApprovalRouteSerializer(many=True, read_only=True)
    m_request_details = ExtendRequestDetailMasterSerializer(
        many=True, read_only=True,
    )

    class Meta:
        model = Request
        fields = [
            'request_id',
            'approval_type_id',
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
            'notification_records',
        ]

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
        notification_records = validated_data.pop('notification_records', [])

        # create request
        request = Request.objects.create(**validated_data)

        # save request detail answer
        for request_detail in request_details:
            request_detail['request_id'] = request.request_id
            self.create_or_update_request_detail(request_detail)
        request_emp = None
        if self.context.get('request'):
            request_emp = self.context['request'].user

        # retrieve approval_route_detail data by emp_affiliation
        # get or create approval_post by approval_post_nm
        for approval_route_detail in approval_route_details:
            approval_post_nm = approval_route_detail.pop('approval_post_nm')
            approval_post = ApprovalPost.objects.get_or_create(
                approval_post_nm=approval_post_nm
            )
            approval_route_detail['approval_post'] = approval_post
        # create approval route and assign approval route details.
        request.register_approval_route(
            request_emp=request_emp,
            department_id=department_id,
            route_details=approval_route_details,
        )

        # assign notification record
        for notification_record in notification_records:
            notification_record['request'] = request
        NotificationRecord.objects.bulk_create(notification_records)

        return request

    def update(self, instance, validated_data):
        """
        Custom update func for update nested serializer.
        """
        request_details = validated_data.pop('request_details', [])
        approval_route_details = validated_data.pop('approval_route_details', [])
        notification_records = validated_data.pop('notification_records', [])

        for request_detail in request_details:
            request_detail['request_id'] = instance.request_id
            self.create_or_update_request_detail(request_detail)
        instance.modified = timezone.now()
        instance.save()

        route_detail_ids = []
        for approval_route_detail in approval_route_details:
            approval_post_nm = approval_route_detail.pop('approval_post_nm')
            approval_post = ApprovalPost.objects.get_or_create(
                approval_post_nm=approval_post_nm
            )
            approval_route_detail['approval_post'] = approval_post

            route_detail_record = ApprovalRouteDetail.objects.update_or_create(
                **approval_route_detail,
            )


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
