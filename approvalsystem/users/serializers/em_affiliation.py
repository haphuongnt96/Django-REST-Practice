# -*- coding: utf-8 -*-

from rest_framework import serializers

from users.models import EmpAffiliation


class EmpAffiliationSerializer(serializers.ModelSerializer):
    business_unit_nm = serializers.CharField(read_only=True)
    department_nm = serializers.CharField(read_only=True)
    segment_nm = serializers.CharField(read_only=True)
    division_nm = serializers.CharField(read_only=True)

    class Meta:
        model = EmpAffiliation
        fields = [
            'emp_affiliation_id',
            'business_unit_id',
            'business_unit_nm',
            'department_id',
            'department_nm',
            'segment_id',
            'segment_nm',
            'division_id',
            'division_nm',
            'main_flg',
        ]
