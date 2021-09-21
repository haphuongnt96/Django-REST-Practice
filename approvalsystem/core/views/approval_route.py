# -*- coding: utf-8 -*-
from rest_framework.generics import ListAPIView
from django.shortcuts import get_object_or_404

from core.models import ApprovalRoute, Request
from core.serializers import ApprovalRouteSerializer


class ApprovalRouteListAPI(ListAPIView):
    queryset = ApprovalRoute.objects.all()
    serializer_class = ApprovalRouteSerializer

    def dispatch(self, request, *args, **kwargs):
        request_id = kwargs['request_id']
        get_object_or_404(Request, pk=request_id)
        return super().dispatch(request, *args, **kwargs)

    def get_queryset(self):
        queryset = super().get_queryset()
        request_id = self.kwargs['request_id']
        return queryset.filter(request_id=request_id)
