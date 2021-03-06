# -*- coding: utf-8 -*-
from rest_framework import serializers
from django.utils.translation import gettext_lazy as _

from core.models import BusinessUnit, Department, Segment, Division


class BusinessUnitSerializer(serializers.ModelSerializer):
    class Meta:
        model = BusinessUnit
        fields = [
            'business_unit_id',
            'business_unit_nm',
        ]


class DepartmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Department
        fields = [
            'department_id',
            'department_nm',
        ]


class SegmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Segment
        fields = [
            'segment_id',
            'segment_nm',
        ]


class DivisionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Division
        fields = [
            'division_id',
            'division_nm',
        ]


class ListOrganizationSerializer(serializers.Serializer):
    business_units = BusinessUnitSerializer(many=True)
    departments = DepartmentSerializer(many=True)
    segments = SegmentSerializer(many=True)
    divisions = DivisionSerializer(many=True)
