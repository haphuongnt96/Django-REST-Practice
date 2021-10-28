from rest_framework import serializers
from core.models import Property


class PropertySerializer(serializers.ModelSerializer):
    class Meta:
        model = Property
        fields = [
            'property_id',
            'property_nm',
            'department_id',
            'segment_id',
            'division_id',
            'address',
            'emp_cd',
            'tel_number',
        ]