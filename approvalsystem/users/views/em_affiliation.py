# -*- coding: utf-8 -*-
from rest_framework.generics import ListAPIView
from rest_framework.pagination import LimitOffsetPagination
from django.db.models import F

from users.models import EmpAffiliation
from users.serializers import DetailEmpAffiliationSerializer


class EmpAffiliationListAPI(ListAPIView):
    queryset = EmpAffiliation.objects.annotate(
        emp_nm=F('emp__emp_nm'),
        business_unit_nm=F('business_unit__business_unit_nm'),
        department_nm=F('department__department_nm'),
        segment_nm=F('segment__segment_nm'),
        division_nm=F('division__division_nm'),

    ).all()
    serializer_class = DetailEmpAffiliationSerializer
    pagination_class = LimitOffsetPagination

    def get_queryset(self):
        queryset = super().get_queryset()

        business_unit_id = self.request.query_params.get('business_unit_id')
        if business_unit_id:
            queryset = queryset.filter(business_unit_id=business_unit_id)

        department_id = self.request.query_params.get('department_id')
        if department_id:
            queryset = queryset.filter(department_id=department_id)

        segment_id = self.request.query_params.get('segment_id')
        if segment_id:
            queryset = queryset.filter(segment_id=segment_id)

        division_id = self.request.query_params.get('division_id')
        if division_id:
            queryset = queryset.filter(division_id=division_id)

        emp_nm = self.request.query_params.get('emp_nm')
        if emp_nm:
            queryset = queryset.filter(emp_nm__icontains=emp_nm)

        return queryset
