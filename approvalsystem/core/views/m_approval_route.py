# -*- coding: utf-8 -*-
from rest_framework.generics import ListAPIView, RetrieveAPIView
from rest_framework.response import Response
from django.db.models import F

from core.models import (
    Segment, Division, ApprovalType, ApprovalClass
)
from core.serializers import (
    ListApprovalTypeSerializer,
    DetailApprovalTypeSerializer,
)


class ApprovalTypeListAPI(ListAPIView):
    # join table by annotate
    queryset = ApprovalType.objects.annotate(
        segment_nm=F('segment__segment_nm'),
        division_nm=F('division__division_nm'),
        approval_class_nm=F('approval_class__approval_class_nm'),
    ).all()
    serializer_class = ListApprovalTypeSerializer

    def list(self, request, *args, **kwargs):
        serializer_class = self.get_serializer_class()

        # list approval types and necessary models for filter
        data = {
            'segments': Segment.objects.all(),
            'divisions': Division.objects.all(),
            'approval_classes': ApprovalClass.objects.all(),
            'approval_types': self.filter_queryset(self.get_queryset()),
        }

        serializer = serializer_class(data)
        return Response(serializer.data)


class ApprovalTypeDetailAPI(RetrieveAPIView):
    queryset = ApprovalType.objects.all()
    serializer_class = DetailApprovalTypeSerializer
    lookup_field = 'approval_type_id'
