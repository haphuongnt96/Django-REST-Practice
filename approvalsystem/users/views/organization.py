# -*- coding: utf-8 -*-
from rest_framework.views import APIView
from rest_framework.response import Response

from users.models import BusinessUnit, Department, Segment, Division
from users.serializers import ListOrganizationSerializer


class OrganizationListAPI(APIView):
    def get(self, *args, **kwargs):
        serializer = ListOrganizationSerializer({
            'business_units': BusinessUnit.objects.all(),
            'departments': Department.objects.all(),
            'segments': Segment.objects.all(),
            'divisions': Division.objects.all(),
        })
        return Response(serializer.data)
