# -*- coding: utf-8 -*-
from rest_framework.generics import ListAPIView
from django.shortcuts import get_object_or_404
from django.utils.translation import gettext_lazy as _

from ..sql.get_request_notification_count import get_request_notification_count

from core.serializers import GetRequestNotificationCount

class RequestNotificationCountAPI(ListAPIView):
    serializer_class = GetRequestNotificationCount

    def get_queryset(self):
        request_user = self.request.user.id
        queryset = get_request_notification_count(request_user)
        return queryset