from abc import ABC

from rest_framework import serializers

from core.models import ApprovalRoute, ApprovalRouteDetail


class ApprovalRouteDetailSerializer(serializers.Serializer, ABC):
    organization_path = serializers.Field(source='organization_path')
    approval_emp_fullname = serializers.Field(source='approval_emp_fullname')

    class Meta:
        model = ApprovalRouteDetail
        fields = [
            'detail_no',
            'organization_path',
            'required_num_approvals',
            'order',
            'notification',
            'approval_status',
            'approval_date',
            'approval_emp_fullname',
        ]


class ApprovalRouteSerializer(serializers.Serializer, ABC):
    approval_route_details = ApprovalRouteDetailSerializer(many=True, read_only=True)
    request_emp_fullname = serializers.Field(source='request_emp_fullname')

    class Meta:
        model = ApprovalRoute
        fields = [
            'request_id',
            'approval_type_cd',
            'judgement_cd',
            'approval_route_details',
        ]
