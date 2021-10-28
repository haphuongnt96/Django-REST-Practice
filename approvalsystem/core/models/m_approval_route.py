# -*- coding: utf-8 -*-

from django.db import models
from django.conf import settings
from django.core.validators import MaxValueValidator

from utils.base_model import BaseModel

from .approval_route import ApprovalPost
from .organization import Department, Segment, Division


class ApprovalClass(BaseModel):
    approval_class_id = models.CharField(max_length=1, primary_key=True)
    approval_class_nm = models.CharField(max_length=10)

    class Meta:
        db_table = 'm_approval_class'


class ApprovalType(BaseModel):
    approval_type_id = models.CharField(max_length=4, primary_key=True)
    approval_type_nm = models.CharField(max_length=30, blank=True)
    approval_class = models.ForeignKey(
        ApprovalClass, on_delete=models.SET_NULL,
        null=True, blank=True
    )
    can_read = models.CharField(max_length=1, blank=True)
    segment = models.ForeignKey(
        Segment, on_delete=models.SET_NULL,
        null=True, blank=True
    )
    division = models.ForeignKey(
        Division, on_delete=models.SET_NULL,
        null=True, blank=True
    )

    class Meta:
        db_table = 'mm_approval_type'

    def __str__(self):
        return self.approval_type_nm


class ApprovalRouteMaster(BaseModel):
    approval_type = models.ForeignKey(
        ApprovalType, on_delete=models.CASCADE,
        related_name='m_approval_routes'
    )
    judge_cd = models.CharField(max_length=1, blank=True)

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
    order = models.PositiveIntegerField()
    notification = models.CharField(
        max_length=1, null=True, blank=True
    )

    approval_post = models.ForeignKey(
        ApprovalPost, on_delete=models.SET_NULL, null=True,
    )
    emp = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, null=True
    )
    required_num_approvals = models.PositiveIntegerField()

    class Meta:
        db_table = 'mm_approval_route'

    def __str__(self):
        return


class Choices(BaseModel):
    choices_type_id = models.CharField(max_length=3, primary_key=True)
    choice_no = models.PositiveIntegerField(blank=True)
    choice_name = models.CharField(max_length=10, blank=True)

    class Meta:
        db_table = 'm_choices'

    def __str__(self):
        return '{}. {}'.format(self.choices_type_id, self.choice_name)


class ColumnType(BaseModel):
    column_type_id = models.CharField(max_length=2, primary_key=True)
    column_type_nm = models.CharField(max_length=10, blank=True)

    class Meta:
        db_table = 'm_column_type'

    def __str__(self):
        return self.column_type_nm


class RequestDetailMaster(BaseModel):
    approval_type = models.ForeignKey(
        ApprovalType, on_delete=models.SET_NULL,
        null=True, related_name='m_request_details'
    )
    request_column_id = models.CharField(max_length=4, primary_key=True)
    column_type = models.ForeignKey(
        ColumnType, on_delete=models.SET_NULL,
        null=True, related_name='m_request_details'
    )
    required = models.BooleanField(default=False)
    max_length = models.PositiveIntegerField(
        validators=[MaxValueValidator(20)], default=20
    )
    column_nm = models.CharField(max_length=20, blank=True)
    choices_type = models.ManyToManyField(
        Choices, related_name='m_request_details',
        null=True, blank=True
    )
    notes = models.CharField(max_length=50, blank=True)

    class Meta:
        db_table = 'm_request_detail'
