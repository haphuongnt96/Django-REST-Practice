# -*- coding: utf-8 -*-

from django.db import models
from django.conf import settings
from django.core.validators import MaxValueValidator

from utils.base_model import BaseModel

from users.models.organization import Department, Segment, Division


class ApprovalClass(BaseModel):
    """
    M_承認分類
    """
    approval_class_id = models.CharField(
        max_length=1, primary_key=True,
        verbose_name='approval_class_id/承認分類ID'
    )
    approval_class_nm = models.CharField(
        max_length=10,
        verbose_name='approval_class_id/承認分類名'
    )

    class Meta:
        db_table = 'm_approval_class'
        verbose_name_plural = 'm_approval_class/M_承認分類'

    def __str__(self) -> str:
        return "{}:{}".format(self.approval_class_id, self.approval_class_nm)


class ApprovalType(BaseModel):
    """
    MM_承認種類
    """
    approval_type_id = models.CharField(
        max_length=4, primary_key=True,
        verbose_name='approval_type_id/承認種類ID'
    )
    approval_type_nm = models.CharField(
        max_length=30, blank=True,
        verbose_name='approval_type_nm/承認種類名'
    )
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
        verbose_name_plural = 'mm_approval_type/MM_承認種類'

    def __str__(self) -> str:
        return "{}:{}".format(self.approval_type_id, self.approval_type_nm)

    @property
    def root_request_details(self):
        """
        Filter root request details
        """
        return self.m_request_details.filter(parent_column=None)


class ApprovalRouteMaster(BaseModel):
    """
    MM_承認ルート
    """
    approval_type = models.ForeignKey(
        ApprovalType, on_delete=models.CASCADE,
        related_name='m_approval_routes'
    )
    judge_cd = models.CharField(max_length=1, blank=True)

    department = models.ForeignKey(
        Department, on_delete=models.SET_NULL,
        null=True, blank=True
    )
    segment = models.ForeignKey(
        Segment, on_delete=models.SET_NULL,
        null=True, blank=True
    )
    division = models.ForeignKey(
        Division, on_delete=models.SET_NULL,
        null=True, blank=True
    )
    order = models.PositiveIntegerField()
    notification = models.CharField(
        max_length=1, null=True, blank=True
    )

    approval_post = models.ForeignKey(
        'core.ApprovalPost', on_delete=models.SET_NULL, null=True,
    )
    emp = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, null=True
    )
    required_num_approvals = models.PositiveIntegerField()

    class Meta:
        db_table = 'mm_approval_route'


    def get_approval_route_detail(self):
        """
        Get necessary data for creating t_approval_route_detail
        """
        result = {
            'order': self.order,
            'notification': self.notification,
            'approval_post': self.approval_post,
            'approval_emp': self.emp,
            'required_num_approvals': self.required_num_approvals,
            'default_flg': True,
        }
        return result


class ColumnType(BaseModel):
    column_type_id = models.CharField(max_length=2, primary_key=True)
    column_type_nm = models.CharField(max_length=10, blank=True)

    class Meta:
        db_table = 'm_column_type'
        verbose_name_plural = 'm_column_type/M_項目タイプ'

    def __str__(self):
        return self.column_type_nm


class RequestDetailMaster(BaseModel):
    """
    T_申請明細
    """
    approval_type = models.ForeignKey(
        ApprovalType, on_delete=models.SET_NULL,
        null=True, related_name='m_request_details'
    )
    request_column_id = models.CharField(
        max_length=4, primary_key=True,
        verbose_name='request_column_id/申請明細ID'
    )
    parent_column = models.ForeignKey(
        'self', on_delete=models.CASCADE,
        null=True, blank=True, related_name='request_detail_children'
    )
    column_type = models.ForeignKey(
        ColumnType, on_delete=models.SET_NULL,
        null=True, related_name='m_request_details'
    )
    required = models.BooleanField(
        default=False,
        verbose_name='required/必須'
    )
    max_length = models.PositiveIntegerField(
        validators=[MaxValueValidator(20)], default=20,
        verbose_name='max_length/サイズ'
    )
    column_nm = models.CharField(
        max_length=30,
        blank=True,verbose_name='column_nm/項目名'
    )
    notes = models.CharField(
        max_length=50,
        blank=True,verbose_name='notes/注釈'
    )

    class Meta:
        db_table = 'm_request_detail'
        ordering = ['request_column_id']
        verbose_name_plural = 'm_request_detail/M_申請明細'

    def __str__(self):
        return '{}. {}'.format(self.request_column_id, self.column_nm)


class Choice(BaseModel):
    """
    M_選択肢
    """
    request_column = models.ForeignKey(
        RequestDetailMaster, on_delete=models.CASCADE,
        null=True, related_name='choices',
    )
    choice_id = models.CharField(max_length=2, primary_key=True)
    choice_nm = models.CharField(max_length=10, blank=True)

    class Meta:
        db_table = 'm_choices'

    def __str__(self):
        return self.choice_nm
