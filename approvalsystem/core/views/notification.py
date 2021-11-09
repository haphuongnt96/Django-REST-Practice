from rest_framework.generics import ListAPIView
from rest_framework.views import APIView
from rest_framework import status
from rest_framework.response import Response
from rest_framework.exceptions import PermissionDenied, NotFound
from django.shortcuts import get_object_or_404
from django.utils.translation import gettext_lazy as _
from core.models import Notification
from core.serializers import NotificationSerializer


class NotificationListAPI(ListAPIView):
    queryset = Notification.objects.all()
    serializer_class = NotificationSerializer

    
    def get_queryset(self):
        queryset = super().get_queryset()
        request_id = self.kwargs['request_id']
        return queryset.filter(request_id=request_id)   