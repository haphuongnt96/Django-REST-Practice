from django.db.models.query import RawQuerySet
from rest_framework.generics import ListAPIView
from rest_framework.views import APIView
from rest_framework import status
from rest_framework.response import Response
from rest_framework.exceptions import PermissionDenied, NotFound
from django.shortcuts import get_object_or_404
from django.utils.translation import gettext_lazy as _, override
from core.models import NotificationRecord, notification
from core.serializers import NotificationRequestSerializer
from ..sql.notification import get_request_emp_notification
from commons.constants import *

class NotificationApplicantAPI(ListAPIView):
    """
    申請者の通知記録

    Returns:
        RawQuerySet: 申請者の承認通知リスト
    """
    serializer_class = NotificationRequestSerializer
    
    def get(self, request, *args, **kwargs):
        self.emp_id = kwargs['emp_id']
        return super().list(request, *args, **kwargs)
    
    def get_queryset(self):
        # 最終承認済の通知を取得
        queryset = get_request_emp_notification(self.emp_id, str(NotificationType.APPROVED.value))
        return queryset