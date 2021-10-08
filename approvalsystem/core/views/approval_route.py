# -*- coding: utf-8 -*-
from rest_framework.generics import ListAPIView, UpdateAPIView, \
    RetrieveAPIView
from rest_framework.views import APIView
from rest_framework import status
from rest_framework.response import Response
from rest_framework.exceptions import PermissionDenied, NotFound
from django.shortcuts import get_object_or_404
from django.utils.translation import gettext_lazy as _

from core.models import Request, ApprovalRoute, ApprovalRouteDetail
from core.serializers import ApprovalRouteSerializer, \
    UpdateStatusApprovalRouteDetailSerializer, SummaryApprovalRouteDetailSerializer


class ApprovalRouteListAPI(ListAPIView):
    queryset = ApprovalRoute.objects.order_by('-created').all()
    serializer_class = ApprovalRouteSerializer

    def get(self, request, *args, **kwargs):
        request_id = kwargs['request_id']
        get_object_or_404(Request, pk=request_id)
        return super().list(request, *args, **kwargs)

    def get_queryset(self):
        queryset = super().get_queryset()
        request_id = self.kwargs['request_id']
        return queryset.filter(request_id=request_id)


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
                approval_status=ApprovalRouteDetail.StatusChoices.not_verified,
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
