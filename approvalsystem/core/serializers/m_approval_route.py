# -*- coding: utf-8 -*-
from rest_framework import serializers

from core.models import (
    ApprovalType, ApprovalClass, ApprovalRouteMaster,
    Choice, RequestDetailMaster
)
from utils.serializers import RecursiveField
from .organization import SegmentSerializer, DivisionSerializer


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


class ApprovalRouteMasterSerializer(serializers.ModelSerializer):
    department_nm = serializers.CharField(read_only=True)
    segment_nm = serializers.CharField(read_only=True)
    division_nm = serializers.CharField(read_only=True)
    approval_post_nm = serializers.CharField(read_only=True)
    emp_nm = serializers.CharField(read_only=True)

    class Meta:
        model = ApprovalRouteMaster
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
            'emp_id',
            'emp_nm',
            'required_num_approvals',
        ]


class RequestDetailMasterSerializer(serializers.ModelSerializer):
    request_detail_children = RecursiveField(many=True)
    column_type_nm = serializers.CharField(read_only=True)
    choices = ChoicesSerializer(many=True)

    class Meta:
        model = RequestDetailMaster
        fields = [
            'request_column_id',
            'column_nm',
            'column_type_id',
            'column_type_nm',
            'required',
            'max_length',
            'choices',
            'request_detail_children',
        ]


class DetailApprovalTypeSerializer(serializers.Serializer):
    m_request_details = RequestDetailMasterSerializer(many=True, source='m_request_details_fetchall')
    m_approval_routes = ApprovalRouteMasterSerializer(many=True, source='m_approval_routes_fetchall')

    class Meta:
        model = ApprovalType
        fields = [
            'approval_type_id',
            'm_request_details',
        ]
