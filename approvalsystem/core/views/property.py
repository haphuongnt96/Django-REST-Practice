from rest_framework.generics import ListAPIView
from rest_framework.views import APIView
from rest_framework import status
from rest_framework.response import Response
from rest_framework.exceptions import PermissionDenied, NotFound
from django.shortcuts import get_object_or_404
from django.utils.translation import gettext_lazy as _
from core.models import Property
from core.serializers import PropertySerializer


class PropertyGetListAPI(ListAPIView):
    queryset = Property.objects.all()
    serializer_class = PropertySerializer

