# -*- coding: utf-8 -*-
from rest_framework.generics import ListAPIView
from rest_framework.views import APIView
from rest_framework import status
from rest_framework.response import Response
from rest_framework.exceptions import PermissionDenied, NotFound
from django.shortcuts import get_object_or_404
from django.utils.translation import gettext_lazy as _

from core.models import Request
from core.serializers import RequestSerializer

class RequestGetListAPI(ListAPIView):
    queryset = Request.objects.all()
    serializer_class = RequestSerializer