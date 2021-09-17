# -*- coding: utf-8 -*-
from rest_framework import serializers

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
