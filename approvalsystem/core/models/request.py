# -*- coding: utf-8 -*-
from django.db import models
from django.apps import apps

from utils.base_model import BaseModel
from .m_approval_route import ApprovalType, RequestDetailMaster


class RequestStatus(BaseModel):
    status_id = models.CharField(max_length=1, primary_key=True)
    status_nm = models.CharField(max_length=5)

    class Meta:
        db_table = 'm_request_status'

    def __str__(self):
        return self.status_nm


class Request(BaseModel):
    request_id = models.AutoField(primary_key=True)
    approval_type = models.ForeignKey(
        ApprovalType, on_delete=models.SET_NULL,
        null=True, related_name='requests'
    )
    status = models.ForeignKey(RequestStatus, on_delete=models.SET_NULL, max_length=1,  null=True, blank=True)
    request_title = models.CharField(max_length=50)

    class Meta:
        db_table = 't_request'

    def register_approval_route(self, request_emp, department_id, route_details: list = None):
        """
        Create approval route when register new request.
        """
        # avoid passing mutable dict to argument
        if not route_details:
            route_details = []
        ApprovalRoute = apps.get_model('core', 'ApprovalRoute')
        ApprovalRouteDetail = apps.get_model('core', 'ApprovalRouteDetail')

        # register extra approval_route_details
        default_route_details = [
            route_master.get_approval_route_detail()
            for route_master in self.approval_type.m_approval_routes.all()
        ] + route_details
        approval_route = ApprovalRoute.objects.create(
            request=self,
            approval_type=self.approval_type,
            request_emp=request_emp,
            department_id=department_id,
        )
        ApprovalRouteDetail.objects.bulk_create([
            ApprovalRouteDetail(
                approval_route=approval_route,
                **route_detail,
            ) for route_detail in default_route_details
        ])
        return approval_route

    @property
    def m_request_details(self):
        return self.approval_type.m_request_details.filter(
            parent_column=None
        )


class RequestDetail(BaseModel):
    request = models.ForeignKey(
        Request, on_delete=models.CASCADE,
        null=True, related_name='request_details',
    )
    request_column = models.ForeignKey(
        RequestDetailMaster, on_delete=models.CASCADE,
        null=True, related_name='request_details',
    )
    request_column_val = models.CharField(max_length=20, blank=True)

    class Meta:
        db_table = 't_request_detail'
