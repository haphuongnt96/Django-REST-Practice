# -*- coding: utf-8 -*-
from rest_framework.generics import ListAPIView
from django.shortcuts import get_object_or_404
from django.utils.translation import gettext_lazy as _

from ..sql.get_approval_comment import get_approval_comment

from core.models import ApprovalRoute
from core.serializers import ApprovalRouteCommentSerializer


class ApprovalRouteCommentListAPI(ListAPIView):
    serializer_class = ApprovalRouteCommentSerializer

    def get(self, request, *args, **kwargs):
        approval_route_id = kwargs['approval_route_id']
        get_object_or_404(ApprovalRoute, pk=approval_route_id)

        return super().list(request, *args, **kwargs)

    def get_queryset(self):
        approval_route_id = self.kwargs['approval_route_id']
        queryset = get_approval_comment(approval_route_id)

        return queryset