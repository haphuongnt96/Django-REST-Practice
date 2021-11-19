# -*- coding: utf-8 -*-
from datetime import date

from django.db import models
from django.conf import settings

from utils.base_model import BaseModel
from commons.constants import ApprovalStatus as ApprovalStatusEnum

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
        null=True, blank=True,
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
        max_length=10, unique=True,
        verbose_name='approval_post_nm/承認役職名'
    )

    class Meta:
        db_table = 'm_approval_post'
        ordering = ['-created']
        verbose_name_plural = 'm_approval_post/M_承認役職'

    def __str__(self):
        return self.approval_post_nm

    def save(self, **kwargs):
        if not self.approval_post_id:
            max_id = ApprovalPost.objects.aggregate(max_id=models.Max('approval_post_id'))['max_id']
            if not max_id:
                max_id = 0
            else:
                max_id = int(max_id)
            self.approval_post_id = str(max_id + 1).zfill(3)
        return super().save(**kwargs)


class ApprovalStatus(BaseModel):
    '''
    M_承認ステータス
    ''' 
    approval_status_id = models.CharField(max_length=1, primary_key=True)
    approval_status_nm = models.CharField(max_length=5)

    class Meta:
        db_table = 'm_approval_status'
        verbose_name_plural = 'm_approval_status/M_承認ステータス'

    def __str__(self) -> str:
        return "{}:{}".format(self.approval_status_id, self.approval_status_nm)



class ApprovalRouteDetail(BaseModel):
    approval_route = models.ForeignKey(
        ApprovalRoute, on_delete=models.CASCADE,
        related_name='approval_route_details'
    )
    detail_no = models.AutoField(primary_key=True)
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
    approval_status = models.ForeignKey(
        ApprovalStatus, on_delete=models.SET_NULL,
        null=True, blank=True,
    )
    approval_date = models.DateField(
        null=True, blank=True
    )
    current_order_flg = models.BooleanField(default=False)
    default_flg = models.BooleanField(default=False)

    class Meta:
        db_table = 't_approval_route_detail'
        ordering = ['order']
        unique_together = [
            ('approval_route', 'approval_emp'),
        ]

    def save(self, *args, **kwargs):
        if self.approval_status and not self.approval_date:
            self.approval_date = date.today()
        elif not self.approval_status:
            self.approval_date = None
        return super().save(*args, **kwargs)
