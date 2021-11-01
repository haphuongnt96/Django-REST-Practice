from utils.base_model import BaseModel
from django.db import models
from .organization import Department, Segment, Division
from users.models import User


class Property(BaseModel):
    """
    物件
    """
    property_id = models.IntegerField(primary_key=True)
    property_nm = models.CharField(max_length=50)
    department_id = models.ForeignKey(Department, on_delete=models.CASCADE)
    segment_id = models.ForeignKey(Segment, on_delete=models.CASCADE)
    division_id = models.ForeignKey(Division, on_delete=models.CASCADE)
    address = models.CharField(max_length=200)
    emp_cd = models.ForeignKey(User, on_delete=models.CASCADE)
    tel_number = models.CharField(max_length=13)

    def __str__(self):
        return self.property_nm
