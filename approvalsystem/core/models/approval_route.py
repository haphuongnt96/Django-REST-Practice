# -*- coding: utf-8 -*-
from django.db import models
from django.conf import settings

from utils.base_model import BaseModel

from .request import Request
from .organization import Department, Segment, Division


class ApprovalRoute(BaseModel):
    request_id = models.ForeignKey(
        Request, on_delete=models.CASCADE
    )
    approval_route_id = models.AutoField(primary_key=True)
    approval_type_cd = models.CharField(max_length=5)
    judgement_cd = models.CharField(
        max_length=1, null=True, blank=True
    )
    request_emp_cd = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.SET_NULL,
        max_length=7, null=True, blank=True,
    )

    class Meta:
        db_table = 't_approval_route'

    @property
    def request_emp_fullname(self) -> str:
        emp_fullname = self.request_emp_cd.emp_nm \
            if self.request_emp_cd else ''
        return emp_fullname


class ApprovalPost(BaseModel):
    approval_post_cd = models.CharField(
        max_length=3, primary_key=True,
    )
    approval_post_nm = models.CharField(max_length=10)

    class Meta:
        db_table = 'm_approval_post'


class ApprovalRouteDetail(BaseModel):
    approval_route_id = models.ForeignKey(
        ApprovalRoute, on_delete=models.CASCADE
    )
    detail_no = models.AutoField(primary_key=True)

    department_cd = models.ForeignKey(
        Department, on_delete=models.SET_NULL,
        max_length=3, null=True, blank=True
    )
    segment_cd = models.ForeignKey(
        Segment, on_delete=models.SET_NULL,
        max_length=3, null=True, blank=True
    )
    division_cd = models.ForeignKey(
        Division, on_delete=models.SET_NULL,
        max_length=1, null=True, blank=True
    )

    required_num_approvals = models.IntegerField(
        null=True, blank=True
    )
    order = models.IntegerField()
    notification = models.CharField(
        max_length=1, null=True, blank=True
    )
    approval_post_cd = models.ForeignKey(
        ApprovalPost, on_delete=models.CASCADE, max_length=3
    )
    approval_emp_cd = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.SET_NULL,
        max_length=7, null=True,
    )
    approval_status = models.BooleanField(
        null=True, blank=True
    )
    approval_date = models.DateField(
        null=True, blank=True
    )

    class Meta:
        db_table = 't_approval_route_detail'

    @property
    def organization_path(self) -> str:
        organization_path = filter(None, [
            self.department_cd,
            self.segment_cd,
            self.division_cd,
        ])
        result = ' '.join(map(str, organization_path))
        return result

    @property
    def approval_emp_fullname(self) -> str:
        emp_fullname = self.approval_emp_fullname.emp_nm \
            if self.approval_emp_cd else ''
        return emp_fullname
