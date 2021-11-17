from utils.base_model import BaseModel
from django.db import models
from users.models.organization import Department, Segment, Division
from users.models import User


class Property(BaseModel):
    """
    物件
    """
    property_id = models.IntegerField(
        primary_key=True,
        verbose_name='property_id/物件ID'
    )
    property_nm = models.CharField(
        max_length=50,
        verbose_name='property_nm/物件名'
    )
    department = models.ForeignKey(
        Department,
        on_delete=models.CASCADE,
        verbose_name='department/部門ID' 
    )
    segment = models.ForeignKey(
        Segment,
        on_delete=models.CASCADE,
        verbose_name='segment/セグメントID'
    )
    division = models.ForeignKey(
        Division,
        on_delete=models.CASCADE,
        verbose_name='division/課ID'
    )
    address = models.CharField(
        max_length=200,
        verbose_name='address/住所'
    )
    emp = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        verbose_name='emp/社員ID'
    )
    tel_number = models.CharField(
        max_length=13,
        verbose_name='tel_number/電話番号'
    )

    class Meta:
        db_table = 'm_property'
        verbose_name_plural = 'm_property/MM_物件'

    def __str__(self):
        return self.property_nm
