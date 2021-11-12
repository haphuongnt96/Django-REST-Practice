from django import db
from utils.base_model import BaseModel
from django.db import models
from users.models.organization import Department, Segment, Division


class ApplicationClassification(BaseModel):
    """
    申請分類
    """
    applicationclassification_id = models.IntegerField(primary_key=True)
    applicationclassification_nm = models.CharField(max_length=20)

    class Meta:
        db_table = 'm_application_classification'
    
    def __str__(self):
        return self.applicationclassification_nm


class ApplicationContents(BaseModel):
    """
    申請内容
    """
    applicationcontents_id = models.IntegerField(primary_key=True)
    applicationcontents_nm = models.CharField(max_length=50)
    department = models.ForeignKey(Department, on_delete=models.CASCADE)
    segment = models.ForeignKey(Segment, on_delete=models.CASCADE)
    division = models.ForeignKey(Division, on_delete=models.CASCADE)
    applicationclassification = models.ForeignKey(ApplicationClassification, on_delete=models.CASCADE)

    class Meta:
        db_table = 'm_application_contents'

    def __str__(self):
        return self.applicationcontents_nm

