# -*- coding: utf-8 -*-
from django.db import models

from utils.base_model import BaseModel


class Department(BaseModel):
    department_cd = models.CharField(primary_key=True, max_length=3)
    department_nm = models.CharField(max_length=10)

    class Meta:
        db_table = 'm_department'

    def __str__(self):
        return self.department_nm


class Segment(BaseModel):
    segment_cd = models.CharField(primary_key=True, max_length=3)
    segment_nm = models.CharField(max_length=10)

    class Meta:
        db_table = 'm_segment'

    def __str__(self):
        return self.segment_nm


class Division(BaseModel):
    division_cd = models.CharField(primary_key=True, max_length=1)
    division_nm = models.CharField(max_length=10)

    class Meta:
        db_table = 'm_division'

    def __str__(self):
        return self.division_nm


class BusinessUnit(BaseModel):
    business_unit_cd = models.CharField(primary_key=True, max_length=2)
    business_unit_nm = models.CharField(max_length=10)

    class Meta:
        db_table = 'm_business_unit'

    def __str__(self):
        return self.business_unit_nm