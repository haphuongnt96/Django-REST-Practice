# -*- coding: utf-8 -*-
from django.db import models

from utils.base_model import BaseModel


class BusinessUnit(BaseModel):
    """
    事業部
    """
    business_unit_id = models.CharField(primary_key=True, max_length=2)
    business_unit_nm = models.CharField(max_length=10)

    class Meta:
        db_table = 'm_business_unit'

    def __str__(self):
        return self.business_unit_nm


class Department(BaseModel):
    """
    部門
    """
    department_id = models.CharField(primary_key=True, max_length=3)
    department_nm = models.CharField(max_length=10)

    class Meta:
        db_table = 'm_department'

    def __str__(self):
        return self.department_nm


class Segment(BaseModel):
    """
    セグメント
    """
    segment_id = models.CharField(primary_key=True, max_length=3)
    segment_nm = models.CharField(max_length=10)

    class Meta:
        db_table = 'm_segment'

    def __str__(self):
        return self.segment_nm


class Division(BaseModel):
    """
    課
    """
    division_id = models.CharField(primary_key=True, max_length=2)
    division_nm = models.CharField(max_length=10)

    class Meta:
        db_table = 'm_division'

    def __str__(self):
        return self.division_nm


class BusinessUnit(BaseModel):
    business_unit_id = models.CharField(primary_key=True, max_length=2)
    business_unit_nm = models.CharField(max_length=10)

    class Meta:
        db_table = 'm_business_unit'

    def __str__(self):
        return self.business_unit_nm
