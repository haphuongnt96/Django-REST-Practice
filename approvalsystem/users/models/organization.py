# -*- coding: utf-8 -*-
from django.db import models

from utils.base_model import BaseModel


class BusinessUnit(BaseModel):
    """
    事業部
    """
    business_unit_id = models.CharField(
        primary_key=True, max_length=2,
        verbose_name='business_unit_id/事業部ID'
    )
    business_unit_nm = models.CharField(
        max_length=10,
        verbose_name='business_unit_nm/事業部名'
    )

    class Meta:
        db_table = 'm_business_unit'
        verbose_name_plural = 'm_business_unit/事業部マスタ'


    def __str__(self):
        return self.business_unit_nm


class Department(BaseModel):
    """
    部門
    """
    department_id = models.CharField(
        primary_key=True, max_length=3,
        verbose_name='department_id/部門ID'
    )
    department_nm = models.CharField(
        max_length=10,
        verbose_name='department_nm/部門名'
    )

    class Meta:
        db_table = 'm_department'
        verbose_name_plural = 'm_department/部門マスタ'

    def __str__(self):
        return f'{self.department_id} - {self.department_nm}'
    


class Segment(BaseModel):
    """
    セグメント
    """
    segment_id = models.CharField(
        primary_key=True, max_length=3,
        verbose_name='segment_id/セグメントID'
    )
    segment_nm = models.CharField(
        max_length=10,
        verbose_name='segment_nm/セグメント名'
    )

    class Meta:
        db_table = 'm_segment'
        verbose_name_plural = 'm_segment/セグメントマスタ'


    def __str__(self):
        return self.segment_nm


class Division(BaseModel):
    """
    課
    """
    division_id = models.CharField(
        primary_key=True, max_length=2,
        verbose_name='division_id/課ID' 
    )
    division_nm = models.CharField(
        max_length=10,
        verbose_name='division_nm/課名'
    )

    class Meta:
        db_table = 'm_division'
        verbose_name_plural = 'm_division/課マスタ'

    def __str__(self):
        return self.division_nm
