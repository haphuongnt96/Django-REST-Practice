# -*- coding: utf-8 -*-
from rest_framework import serializers
from django.utils.translation import gettext_lazy as _
from django.db import models
from django.db.models import F

from core.models import ApprovalRoute, ApprovalRouteDetail
from users.serializers.organization import BusinessUnitSerializer, DepartmentSerializer,\
                                         SegmentSerializer, DivisionSerializer
from users.serializers import UserDetailSerializer


class CustomListApprovalRouteDetailSerializer(serializers.ListSerializer):
    """
    Custom ListSerializer for changing behavior of queryset (like filter, annotate..)
    for model ApprovalRoute (table t_approval_route)
    """
    def to_representation(self, data):
        if isinstance(data, (models.Manager, models.QuerySet)):
            data = data.annotate(
                approval_post_nm=F('approval_post__approval_post_nm'),
                approval_emp_nm=F('approval_emp__emp_nm'),
            )
        return super().to_representation(data)


class ApprovalRouteDetailSerializer(serializers.ModelSerializer):
    """
    Serializer in detail model t_approval_route_detail.
    """
    approval_post_nm = serializers.CharField(read_only=True)
    approval_emp_nm = serializers.CharField(read_only=True)

    class Meta:
        model = ApprovalRouteDetail
        list_serializer_class = CustomListApprovalRouteDetailSerializer
        fields = [
            'detail_no',
            'required_num_approvals',
            'order',
            'notification',
            'approval_post_id',
            'approval_post_nm',
            'approval_emp_id',
            'approval_emp_nm',
            'approval_status',
            'approval_date',
        ]


class CustomListApprovalRouteSerializer(serializers.ListSerializer):
    """
    Custom ListSerializer for changing behavior of queryset (like filter, annotate..)
    for model ApprovalRoute (table t_approval_route)
    """
    def to_representation(self, data):
        if isinstance(data, (models.Manager, models.QuerySet)):
            data = data.annotate(
                request_emp_nm=F('request_emp__emp_nm'),
                business_unit_nm=F('business_unit__business_unit_nm'),
                department_nm=F('department__department_nm'),
                segment_nm=F('segment__segment_nm'),
                division_nm=F('division__division_nm'),
            )
        return super().to_representation(data)


class DetailApprovalRouteSerializer(serializers.ModelSerializer):
    """
    Serializer in detail model t_approval_route
    """
    approval_route_details = ApprovalRouteDetailSerializer(many=True)
    request_emp_nm = serializers.CharField(read_only=True)
    business_unit_nm = serializers.CharField(read_only=True)
    department_nm = serializers.CharField(read_only=True)
    segment_nm = serializers.CharField(read_only=True)
    division_nm = serializers.CharField(read_only=True)

    class Meta:
        model = ApprovalRoute
        list_serializer_class = CustomListApprovalRouteSerializer
        fields = [
            'approval_route_id',
            'judgement_cd',
            'request_emp_id',
            'request_emp_nm',
            'business_unit_id',
            'business_unit_nm',
            'department_id',
            'department_nm',
            'segment_id',
            'segment_nm',
            'division_id',
            'division_nm',
            'request_dt',
            'approval_route_details',
        ]


class ApprovalRouteSerializer(serializers.ModelSerializer):
    approval_route_details = ApprovalRouteDetailSerializer(many=True, read_only=True)
    business_unit = BusinessUnitSerializer(many=False, read_only=True)
    department = DepartmentSerializer(many=False, read_only=True)
    segment = SegmentSerializer(many=False, read_only=True)
    division = DivisionSerializer(many=False, read_only=True)
    request_emp = UserDetailSerializer(many=False, read_only=True)

    class Meta:
        model = ApprovalRoute
        fields = [
            'request_id',
            'approval_route_id',
            'approval_type_id',
            'judgement_cd',
            'business_unit',
            'department',
            'segment',
            'division',
            'request_emp',
            'approval_route_details',
            'created',
        ]


class UpdateStatusApprovalRouteDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = ApprovalRouteDetail
        fields = [
            'detail_no',
            'approval_status',
        ]
        read_only_fields = [
            'detail_no',
        ]

    @classmethod
    def is_allowed_status_transition(cls, old_status, new_status):
        status_choices = ApprovalRouteDetail.StatusChoices
        allowed = (
            (status_choices.not_verified, status_choices.approved),
            (status_choices.not_verified, status_choices.rejected),
        )
        return (old_status, new_status) in allowed

    def validate_approval_status(self, value):
        if self.instance:
            if not self.is_allowed_status_transition(
                old_status=self.instance.approval_status,
                new_status=value
            ):
                raise serializers.ValidationError(
                    _('Invalid approval status.')
                )
        return value


class SummaryApprovalRouteDetailSerializer(serializers.Serializer):
    approval_notification = serializers.IntegerField()
