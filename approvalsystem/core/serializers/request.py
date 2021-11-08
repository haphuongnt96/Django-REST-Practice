from rest_framework import serializers
from django.utils.translation import gettext_lazy as _

from core.models import Request, RequestStatus
from .approval_route import ApprovalRouteSerializer
from users.serializers.organization import BusinessUnitSerializer, DepartmentSerializer, SegmentSerializer, DivisionSerializer


class RequestStatusSerializer(serializers.ModelSerializer):
    class Meta:
        model = RequestStatus
        fields = [
            'status_id',
            'status_nm',
        ]

class RequestSerializer(serializers.ModelSerializer):
    approvalroute = ApprovalRouteSerializer(many=True, read_only=True)
    status = RequestStatusSerializer(read_only=True)

    class Meta:
        model = Request
        fields = [
            'request_id',
            'request_title',
            'status',
            'approvalroute',
        ]

    def get_approvalroute(self, instance):
        '''
        新しい承認ルートにソートする
        '''
        status = instance.status.all().order_by('-approval_route_id')