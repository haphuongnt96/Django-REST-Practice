# -*- coding: utf-8 -*-
from rest_framework import serializers
from django.db import models
from django.db.models import F

from core.models import (
    ApprovalType, ApprovalClass, ApprovalRouteMaster,
    Choice, RequestDetailMaster
)
from utils.serializers import RecursiveField
from users.serializers.organization import SegmentSerializer, DivisionSerializer


class ApprovalClassSerializer(serializers.ModelSerializer):
    class Meta:
        model = ApprovalClass
        fields = [
            'approval_class_id',
            'approval_class_nm',
        ]


class ApprovalTypeSerializer(serializers.ModelSerializer):
    segment_nm = serializers.CharField(read_only=True)
    division_nm = serializers.CharField(read_only=True)
    approval_class_nm = serializers.CharField(read_only=True)

    class Meta:
        model = ApprovalType
        fields = [
            'approval_type_id',
            'approval_type_nm',
            'approval_class_id',
            'approval_class_nm',
            'segment_id',
            'segment_nm',
            'division_id',
            'division_nm',
        ]


class ListApprovalTypeSerializer(serializers.Serializer):
    segments = SegmentSerializer(many=True)
    divisions = DivisionSerializer(many=True)
    approval_classes = ApprovalClassSerializer(many=True)
    approval_types = ApprovalTypeSerializer(many=True)


class ChoicesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Choice
        fields = [
            'choice_id',
            'choice_nm',
        ]


class CustomListApprovalRouteMasterSerializer(serializers.ListSerializer):
    """
    Custom ListSerializer for changing behavior of queryset (like filter, annotate..)
    for model RequestDetailMaster (table m_request_detail)
    """
    def to_representation(self, data):
        if isinstance(data, (models.Manager, models.QuerySet)):
            data = data.annotate(
                department_nm=F('department__department_nm'),
                segment_nm=F('segment__segment_nm'),
                division_nm=F('division__division_nm'),
                approval_post_nm=F('approval_post__approval_post_nm'),
                approval_emp_nm=F('emp__emp_nm'),
            )
        return super().to_representation(data)


class ApprovalRouteMasterSerializer(serializers.ModelSerializer):
    department_nm = serializers.CharField(read_only=True)
    segment_nm = serializers.CharField(read_only=True)
    division_nm = serializers.CharField(read_only=True)
    approval_post_nm = serializers.CharField(read_only=True)
    approval_emp_id = serializers.CharField(read_only=True, source='emp_id')
    approval_emp_nm = serializers.CharField(read_only=True)
    default_flg = serializers.BooleanField(default=True, read_only=True)

    class Meta:
        model = ApprovalRouteMaster
        list_serializer_class = CustomListApprovalRouteMasterSerializer
        fields = [
            'approval_type_id',
            'judge_cd',
            'department_id',
            'department_nm',
            'segment_id',
            'segment_nm',
            'division_id',
            'division_nm',
            'order',
            'notification',
            'approval_post_id',
            'approval_post_nm',
            'approval_emp_id',
            'approval_emp_nm',
            'required_num_approvals',
            'default_flg',
        ]


class CustomListRequestDetailMasterSerializer(serializers.ListSerializer):
    """
    Custom ListSerializer for changing behavior of queryset (like filter, annotate..)
    for model RequestDetailMaster (table m_request_detail)
    """
    def to_representation(self, data):
        # annotate column_type_nm (join table m_column_type)
        if isinstance(data, (models.Manager, models.QuerySet)):
            data = data.annotate(
                column_type_nm=F('column_type__column_type_nm')
            ).prefetch_related('choices')

        return super().to_representation(data)


class RequestDetailChildrenSerializer(RecursiveField):
    class Meta:
        list_serializer_class = CustomListRequestDetailMasterSerializer

    def to_representation(self, value):
        serializer = self.parent.parent.__class__(value, context=self.context)
        return serializer.data


class RequestDetailMasterSerializer(serializers.ModelSerializer):
    request_detail_children = RequestDetailChildrenSerializer(many=True)
    column_type_nm = serializers.CharField(read_only=True)
    choices = ChoicesSerializer(many=True)

    class Meta:
        model = RequestDetailMaster
        list_serializer_class = CustomListRequestDetailMasterSerializer
        fields = [
            'request_column_id',
            'column_nm',
            'column_type_id',
            'column_type_nm',
            'required',
            'max_length',
            'choices',
            'notes',
            'request_detail_children',
        ]


class DetailApprovalTypeSerializer(serializers.Serializer):
    approval_route_details = ApprovalRouteMasterSerializer(many=True, source='m_approval_routes')
    m_request_details = RequestDetailMasterSerializer(many=True, source='root_request_details')

    class Meta:
        model = ApprovalType
        fields = [
            'approval_type_id',
            'approval_route_details',
            'm_request_details',
        ]
