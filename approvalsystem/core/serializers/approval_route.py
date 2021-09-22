# -*- coding: utf-8 -*-
from rest_framework import serializers
from django.utils.translation import gettext_lazy as _

from core.models import ApprovalRoute, ApprovalRouteDetail


class ApprovalRouteDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = ApprovalRouteDetail
        fields = [
            'detail_no',
            'department_cd',
            'segment_cd',
            'division_cd',
            'required_num_approvals',
            'order',
            'notification',
            'approval_post_cd',
            'approval_post_nm',
            'approval_emp_cd',
            'approval_emp_nm',
            'approval_status',
            'approval_date',
        ]


class ApprovalRouteSerializer(serializers.ModelSerializer):
    approval_route_details = ApprovalRouteDetailSerializer(many=True, read_only=True)

    class Meta:
        model = ApprovalRoute
        fields = [
            'request_id',
            'approval_route_id',
            'approval_type_cd',
            'judgement_cd',
            'request_emp_cd',
            'request_emp_nm',
            'approval_route_details',
        ]


class UpdateStatusApprovalRouteDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = ApprovalRouteDetail
        fields = [
            'approval_status'
        ]

    @classmethod
    def is_allowed_status_transition(cls, old_status, new_status):
        status_choices = ApprovalRouteDetail.StatusChoices
        allowed = (
            (status_choices.not_verified, status_choices.approved),
            (status_choices.not_verified, status_choices.rejected),
        )
        return (old_status, new_status) in allowed

    def validate_approval_status(self, value):
        if self.instance:
            if not self.is_allowed_status_transition(
                old_status=self.instance.approval_status,
                new_status=value
            ):
                raise serializers.ValidationError(
                    _('Invalid approval status.')
                )
        return value


class SummaryApprovalRouteDetailSerializer(serializers.Serializer):
    approval_notification = serializers.IntegerField()
