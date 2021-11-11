# -*- coding: utf-8 -*-
from rest_framework.generics import ListAPIView
from rest_framework.views import APIView
from rest_framework.exceptions import PermissionDenied, NotFound
from rest_framework.response import Response
from rest_framework import status
from django.shortcuts import get_object_or_404
from django.utils.translation import gettext_lazy as _

from ..sql.get_approval_comment import get_approval_comment

from core.models import ApprovalRoute, ApprovalRouteComment
from core.serializers import ApprovalRouteCommentSerializer, CreateApprovalRouteCommentSerializer


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

class ApprovalRouteCommentAPI(APIView):
    def post(self, request, *args, **kwargs):
        request_id = kwargs['request_id']
        try:
            approval_route = ApprovalRoute.objects.filter(request_id=request_id).latest('created')
        except ApprovalRoute.DoesNotExist:
            raise NotFound(
                _('Invalid request_id or does not exist Approval Routes.')
            )
        approval_route_comment_serializer = CreateApprovalRouteCommentSerializer(
            data=request.data
        )
        if approval_route_comment_serializer.is_valid():
            # 新規コメントレコード作成
            new_comment = ApprovalRouteComment(
                request_id=request_id,
                approval_route_id=request.data['approval_route_id'],
                ins_emp_id=request.data['ins_emp_id'],
                comment_no=request.data['comment_no'],
                comment=request.data['comment']
            )
            new_comment.save()
            return Response(approval_route_comment_serializer.data)
        else:
            return Response(approval_route_comment_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
