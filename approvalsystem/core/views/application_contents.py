from rest_framework.generics import ListAPIView
from rest_framework.views import APIView
from rest_framework import status
from rest_framework.response import Response
from rest_framework.exceptions import PermissionDenied, NotFound
from django.shortcuts import get_object_or_404
from django.utils.translation import gettext_lazy as _
from core.models import ApplicationContents
from core.serializers import ApplicationContentsSerializer


class ApplicationContentsGetListAPI(ListAPIView):
    queryset = ApplicationContents.objects.all()
    serializer_class = ApplicationContentsSerializer