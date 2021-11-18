# -*- coding: utf-8 -*-
from rest_framework import serializers
from django.utils.translation import gettext_lazy as _

from core.models.approval_route_comment import ApprovalRouteComment


class ApprovalRouteCommentSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    request_id = serializers.IntegerField(read_only=True)
    approval_route_id = serializers.IntegerField(read_only=True)
    approval_type_id = serializers.CharField(read_only=True)
    comment_no = serializers.IntegerField(read_only=True)
    comment = serializers.CharField(read_only=True)
    emp_nm = serializers.CharField(read_only=True)
    created = serializers.DateTimeField(read_only=True)


class CreateApprovalRouteCommentSerializer(serializers.Serializer):
    request_id = serializers.IntegerField()
    approval_route_id = serializers.IntegerField()
    ins_emp_id = serializers.IntegerField()
    comment = serializers.CharField()

    def create(self, validated_data):
        return ApprovalRouteComment.objects.create(**validated_data)

