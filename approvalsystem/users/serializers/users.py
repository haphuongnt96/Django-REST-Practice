# -*- coding: utf-8 -*-
from rest_framework import serializers

from users.models import User


class UserDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = [
            'id',
            'emp_cd',
            'emp_nm',
            'email',
        ]
