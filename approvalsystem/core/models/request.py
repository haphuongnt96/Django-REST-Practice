# -*- coding: utf-8 -*-
from django.db import models

from utils.base_model import BaseModel


class Request(BaseModel):
    request_id = models.AutoField()
    status = models.CharField(max_length=1)

    class Meta:
        db_table = 't_reuqest'
