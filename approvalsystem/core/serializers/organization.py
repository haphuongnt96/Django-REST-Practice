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
        model = BusinessUnit
        fields = [
            'department_id',
            'department_nm',
        ]

class SegmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = BusinessUnit
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