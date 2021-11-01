from rest_framework import serializers
from core.models import Property
from users.serializers import UserDetailSerializer
from django.utils.translation import gettext_lazy as _


class PropertySerializer(serializers.ModelSerializer):
    emp_cd = UserDetailSerializer(read_only=True)

    class Meta:
        model = Property
        fields = [
            'property_id',
            'property_nm',
            'department_id',
            'segment_id',
            'division_id',
            'address',
            'tel_number',
            'emp_cd',
        ]