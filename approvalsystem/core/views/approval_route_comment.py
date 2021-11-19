# -*- coding: utf-8 -*-
from rest_framework.generics import ListAPIView
from rest_framework.views import APIView
from rest_framework.exceptions import PermissionDenied, NotFound
from rest_framework.response import Response
from rest_framework import status
from django.shortcuts import get_object_or_404
from django.utils.translation import gettext_lazy as _

from ..sql.get_approval_comment import get_approval_comment

from core.models import Request, ApprovalRouteComment
from core.serializers import ApprovalRouteCommentSerializer, CreateApprovalRouteCommentSerializer


class ApprovalRouteCommentListAPI(ListAPIView):
    """
    申請IDに対するコメントを取得する。
    """
    serializer_class = ApprovalRouteCommentSerializer

    def get(self, request, *args, **kwargs):
        request_id = kwargs['request_id']

        return super().list(request, *args, **kwargs)

    def get_queryset(self):
        request_id = self.kwargs['request_id']
        queryset = get_approval_comment(request_id)

        return queryset

class ApprovalRouteCommentAPI(APIView):
    """
    申請IDに対してコメントを保存する。
    """
    def post(self, request, *args, **kwargs):
        request_id = kwargs['request_id'] # 申請ID
        approval_route_id=request.data['approval_route_id']  # 承認ルートID
        approval_route_comment_serializer = CreateApprovalRouteCommentSerializer(
            data=request.data
        )
        if approval_route_comment_serializer.is_valid():
            try:
                # 既に保存されている最新コメントNoから１を増やす。（保存されているコメントがない場合１となる）
                lastest_comment_no = ApprovalRouteComment.objects.filter(request_id=request_id, approval_route_id=approval_route_id).latest('created').comment_no
                new_comment_no = lastest_comment_no + 1
            except ApprovalRouteComment.DoesNotExist:
                # 該当申請ID・承認ルートIDに対するコメントレコードがない場合
                new_comment_no = 1
            
            # 新規コメントレコード作成
            new_comment = ApprovalRouteComment(
                request_id=request_id,
                approval_route_id=approval_route_id,
                ins_emp_id=request.data['ins_emp_id'],
                comment_no=new_comment_no,
                comment=request.data['comment']
            )
            new_comment.save()
            return Response(approval_route_comment_serializer.data)
        else:
            return Response(approval_route_comment_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
