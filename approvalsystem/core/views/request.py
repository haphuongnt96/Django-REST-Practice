# -*- coding: utf-8 -*-
from rest_framework.generics import ListAPIView, CreateAPIView, RetrieveUpdateAPIView
from rest_framework import status
from rest_framework.response import Response
from django.db import transaction

from core.models import Request
from core.serializers import RequestSerializer, DetailRequestSerializer


class RequestGetListAPI(ListAPIView):
    # レコード生成降順で整列
    queryset = Request.objects.all().order_by('-created')
    serializer_class = RequestSerializer


class RegisterRequestAPI(CreateAPIView):
    queryset = Request.objects.all()
    serializer_class = DetailRequestSerializer

    @transaction.atomic
    def create(self, *args, **kwargs):
        serializer = self.get_serializer(data=self.request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class RetrieveUpdateRequestAPI(RetrieveUpdateAPIView):
    queryset = Request.objects.all()
    serializer_class = DetailRequestSerializer
    lookup_field = 'request_id'

    @transaction.atomic
    def update(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=self.request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
