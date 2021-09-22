# -*- coding: utf-8 -*-
from rest_framework.views import APIView
from rest_framework.generics import ListAPIView, UpdateAPIView, \
    RetrieveAPIView
from rest_framework.response import Response
from django.shortcuts import get_object_or_404

from core.models import Request, ApprovalRoute, ApprovalRouteDetail
from core.serializers import ApprovalRouteSerializer, \
    UpdateStatusApprovalRouteDetailSerializer, SummaryApprovalRouteDetailSerializer


class ApprovalRouteListAPI(ListAPIView):
    queryset = ApprovalRoute.objects.all()
    serializer_class = ApprovalRouteSerializer

    def get(self, request, *args, **kwargs):
        request_id = kwargs['request_id']
        get_object_or_404(Request, pk=request_id)
        return super().list(request, *args, **kwargs)

    def get_queryset(self):
        queryset = super().get_queryset()
        request_id = self.kwargs['request_id']
        return queryset.filter(request_id=request_id)


class UpdateStatusApprovalRouteDetailAPI(UpdateAPIView):
    queryset = ApprovalRouteDetail.objects.all()
    lookup_field = 'detail_no'
    serializer_class = UpdateStatusApprovalRouteDetailSerializer


class CountNotVerifyApprovalRouteDetailAPI(RetrieveAPIView):
    queryset = ApprovalRouteDetail.objects.all()
    serializer_class = SummaryApprovalRouteDetailSerializer

    def get_queryset(self):
        queryset = super().get_queryset()
        return queryset.filter(
            approval_status=ApprovalRouteDetail.StatusChoices.not_verified
        )

    def retrieve(self, request, *args, **kwargs):
        queryset = self.get_queryset()

        result = {
            'approval_notification': queryset.count()
        }
        return Response(result)
