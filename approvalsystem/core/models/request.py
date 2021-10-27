# -*- coding: utf-8 -*-
from django.db import models
from django.conf import settings

from utils.base_model import BaseModel

class Request(BaseModel):
    request_id = models.AutoField(primary_key=True)
    status = models.CharField(max_length=1)
    request_title = models.CharField(max_length=50)

    class Meta:
        db_table = 't_reuqest'
