# -*- coding: utf-8 -*-
from datetime import date

from django.db import models
from django.conf import settings

from utils.base_model import BaseModel
from .approval_route import ApprovalRoute

from .request import Request
from users.models import User


class ApprovalRouteComment(BaseModel):

    request = models.ForeignKey(
        Request, on_delete=models.CASCADE
    )

    approval_route = models.ForeignKey(
        ApprovalRoute, on_delete=models.CASCADE
    )
    comment_no = models.IntegerField()

    comment = models.CharField(
        max_length=100
    )

    ins_emp = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.SET_NULL,
        max_length=7, null=True, blank=True,
    )

    class Meta:
        db_table = 't_approval_route_comment'
        verbose_name_plural = 't_approval_route_comment/T_承認ルートコメント'
