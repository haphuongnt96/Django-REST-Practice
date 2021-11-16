# -*- coding: utf-8 -*-
from datetime import date

from django.db import models
from django.conf import settings

from utils.base_model import BaseModel

from users.models.organization import BusinessUnit, Department, Segment, Division
from .request import Request
from .m_approval_route import ApprovalType


class ApprovalRoute(BaseModel):
    request = models.ForeignKey(
        Request, on_delete=models.CASCADE,
        null=True, related_name='approval_routes'
    )
    approval_route_id = models.AutoField(
        primary_key=True,
        verbose_name='approval_route_id/承認ルートID'
    )
    approval_type = models.ForeignKey(
        ApprovalType, on_delete=models.SET_NULL,
        null=True, related_name='approval_routes',
    )
    judgement_cd = models.CharField(
        max_length=1, null=True, blank=True,
        verbose_name='judgement_cd/判定コード'
    )
    request_emp = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.SET_NULL,
        null=True, blank=True,
    )
    business_unit = models.ForeignKey(
        BusinessUnit, on_delete=models.SET_NULL,
        null=True, blank=True,
    )
    department = models.ForeignKey(
        Department, on_delete=models.SET_NULL,
        null=True, blank=True,
    )
    segment = models.ForeignKey(
        Segment, on_delete=models.SET_NULL,
        null=True, blank=True,
    )
    division = models.ForeignKey(
        Division, on_delete=models.SET_NULL,
        null=True, blank=True,
    )
    request_dt = models.DateTimeField(
        null=True, blank=True, editable=False,
        verbose_name='request_dt/申請日時'
    )

    class Meta:
        db_table = 't_approval_route'
        verbose_name_plural = 't_approval_route/T_承認ルート'



class ApprovalPost(BaseModel):
    approval_post_id = models.CharField(
        max_length=3, primary_key=True,
        verbose_name='approval_post_id/承認役職ID'
    )
    approval_post_nm = models.CharField(
        max_length=10,
        verbose_name='approval_post_nm/承認役職名'
    )

    class Meta:
        db_table = 'm_approval_post'
        ordering = ['-created']
        verbose_name_plural = 'm_approval_post/M_承認役職'

    def __str__(self):
        return self.approval_post_nm


class ApprovalRouteDetail(BaseModel):
    class StatusChoices(models.TextChoices):
        not_verified = '0', 'Not Verified'
        approved = '1', 'Approved'
        rejected = '2', 'Rejected'

    approval_route = models.ForeignKey(
        ApprovalRoute, on_delete=models.CASCADE,
        related_name='approval_route_details'
    )
    detail_no = models.AutoField(primary_key=True)

    department = models.ForeignKey(
        Department, on_delete=models.SET_NULL,
        max_length=3, null=True, blank=True
    )
    segment = models.ForeignKey(
        Segment, on_delete=models.SET_NULL,
        max_length=3, null=True, blank=True
    )
    division = models.ForeignKey(
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
    approval_post = models.ForeignKey(
        ApprovalPost, on_delete=models.CASCADE, max_length=3
    )
    approval_emp = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.SET_NULL,
        max_length=7, null=True,
    )
    approval_status = models.CharField(
        max_length=1, choices=StatusChoices.choices,
        default=StatusChoices.not_verified,
    )
    approval_date = models.DateField(
        null=True, blank=True, editable=False
    )

    class Meta:
        db_table = 't_approval_route_detail'

    def save(self, *args, **kwargs):
        if self.approval_status != self.StatusChoices.not_verified and \
                not self.approval_date:
            self.approval_date = date.today()
        elif self.approval_status == self.StatusChoices.not_verified:
            self.approval_date = None
        return super().save(*args, **kwargs)
