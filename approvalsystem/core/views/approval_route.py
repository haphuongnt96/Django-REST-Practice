# -*- coding: utf-8 -*-
from rest_framework.generics import RetrieveAPIView
from rest_framework.views import APIView
from rest_framework import status
from rest_framework.response import Response
from rest_framework.exceptions import PermissionDenied, NotFound
from django.utils.translation import gettext_lazy as _

from core.models import ApprovalRoute, ApprovalRouteDetail
from core.serializers import (
    UpdateStatusApprovalRouteDetailSerializer,
    SummaryApprovalRouteDetailSerializer,
)


class ApprovalRequestAPI(APIView):
    def post(self, request, *args, **kwargs):
        request_id = kwargs['request_id']
        try:
            approval_route = ApprovalRoute.objects.filter(request_id=request_id).latest('created')
        except ApprovalRoute.DoesNotExist:
            raise NotFound(
                _('Invalid request_id or does not exist Approval Routes.')
            )
        try:
            approval_route_detail = ApprovalRouteDetail.objects.filter(
                approval_route_id=approval_route.approval_route_id,
                approval_status=ApprovalRouteDetail.approval_status_id,
                #StatusChoices.not_verified,
            ).earliest('detail_no')
        except ApprovalRouteDetail.DoesNotExist:
            raise NotFound(
                _('Does not exist Approval Route Details.')
            )
        if approval_route_detail.approval_emp_cd != request.user:
            raise PermissionDenied(
                _('Invalid approval user.')
            )
        approval_detail_serializer = UpdateStatusApprovalRouteDetailSerializer(
            instance=approval_route_detail,
            data=request.data,
        )
        if approval_detail_serializer.is_valid():
            approval_detail_serializer.save()
            return Response(approval_detail_serializer.data)
        else:
            return Response(approval_detail_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class CountSummaryApprovalRouteDetailAPI(RetrieveAPIView):
    queryset = ApprovalRouteDetail.objects.all()
    serializer_class = SummaryApprovalRouteDetailSerializer

    def get_queryset(self):
        queryset = super().get_queryset()
        return queryset.filter(
            approval_status=ApprovalRouteDetail.StatusChoices.not_verified,
            approval_emp_cd=self.request.user
        )

    def retrieve(self, request, *args, **kwargs):
        queryset = self.get_queryset()

        result = {
            'approval_notification': queryset.count()
        }
        return Response(result)
