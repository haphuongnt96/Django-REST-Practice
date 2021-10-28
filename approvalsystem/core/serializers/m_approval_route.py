# -*- coding: utf-8 -*-
from rest_framework import serializers

from core.models import (
    ApprovalType, ApprovalClass, ApprovalRouteMaster,
    Choices, RequestDetailMaster
)
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
        model = Choices
        fields = [
            'choices_type_id',
            'choice_no',
            'choice_nm',
        ]


class RequestDetailMasterSerializer(serializers.ModelSerializer):
    column_type_nm = serializers.CharField(read_only=True)
    choices_type = ChoicesSerializer(many=True)

    class Meta:
        model = RequestDetailMaster
        fields = [
            'request_column_id',
            'column_nm',
            'column_type_id',
            'column_type_nm',
            'required',
            'max_length',
            'choices_type',
        ]


class DetailApprovalTypeSerializer(serializers.Serializer):
    m_request_details = RequestDetailMasterSerializer(many=True)

    class Meta:
        model = ApprovalType
        fields = [
            'approval_type_id',
            'm_request_details',
        ]
