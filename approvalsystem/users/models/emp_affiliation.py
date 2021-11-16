# -*- coding: utf-8 -*-

from django.db import models
from django.conf import settings

from utils.base_model import BaseModel
from core.models import Division, Segment, Department, BusinessUnit


class EmpAffiliation(BaseModel):
    emp_affiliation_id = models.AutoField(primary_key=True)
    emp = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.SET_NULL,
        null=True, blank=True, related_name='affiliations'
    )
    business_unit = models.ForeignKey(
        BusinessUnit, on_delete=models.SET_NULL,
        null=True, blank=True, related_name='emp_affiliations',
        verbose_name='business_unit/事業部'
    )
    department = models.ForeignKey(
        Department, on_delete=models.SET_NULL,
        null=True, blank=True, related_name='emp_affiliations',
        verbose_name='department/部門'
    )
    segment = models.ForeignKey(
        Segment, on_delete=models.SET_NULL,
        null=True, blank=True, related_name='emp_affiliations',
        verbose_name='segment/セグメント'
    )
    division = models.ForeignKey(
        Division, on_delete=models.SET_NULL,
        null=True, blank=True, related_name='emp_affiliations',
        verbose_name='division/課'
    )
    main_flg = models.BooleanField(verbose_name='main_flg/主フラグ')

    class Meta:
        db_table = 'm_emp_affiliation'
        verbose_name_plural = 'm_emp_affiliation/社員所属'
