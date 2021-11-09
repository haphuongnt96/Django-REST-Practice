from utils.base_model import BaseModel
from django.db import models


class Notification(BaseModel):
    """
    お知らせ
    """
    notification_id = models.IntegerField(primary_key=True)
    notification = models.CharField(max_length=200)
    delete_flag = models.BooleanField(default=False)

    class Meta:
        db_table = 'm_notification'
    