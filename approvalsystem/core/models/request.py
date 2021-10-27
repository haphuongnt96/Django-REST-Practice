# -*- coding: utf-8 -*-
from django.db import models
from django.conf import settings

from utils.base_model import BaseModel

class RequestStatus(BaseModel):
    status_id = models.CharField(max_length=1, primary_key=True)
    status_nm = models.CharField(max_length=5)

    class Meta:
        db_table = 'm_request_status'

    def __str__(self):
        return self.status_nm

class Request(BaseModel):
    request_id = models.AutoField(primary_key=True)
    status = models.ForeignKey(RequestStatus, on_delete=models.SET_NULL, max_length=1,  null=True, blank=True)
    request_title = models.CharField(max_length=50)

    class Meta:
        db_table = 't_reuqest'

