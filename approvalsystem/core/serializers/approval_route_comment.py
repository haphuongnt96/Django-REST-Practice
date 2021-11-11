# -*- coding: utf-8 -*-
from rest_framework import serializers
from django.utils.translation import gettext_lazy as _


class ApprovalRouteCommentSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    request_id = serializers.IntegerField(read_only=True)
    approval_route_id = serializers.IntegerField(read_only=True)
    approval_type_id = serializers.CharField(read_only=True)
    comment_no = serializers.IntegerField(read_only=True)
    comment = serializers.CharField(read_only=True)
    emp_nm = serializers.CharField(read_only=True)
    created = serializers.DateTimeField(read_only=True)
