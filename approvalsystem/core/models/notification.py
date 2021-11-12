from django.db import models
from django.conf import settings

from utils.base_model import BaseModel
from .request import Request
from users.models import User


class NotificationType(BaseModel):
    """
    M_通知区分
    """
    
    notification_type_id = models.CharField(max_length=2, primary_key=True,
                                            verbose_name='notification_type_id/通知区分ID')
    notification_type_nm = models.CharField(max_length=10,
                                            verbose_name='notification_type_nm/通知区分名')

    class Meta:
        db_table = 'm_notification_type'
        verbose_name_plural = 'm_notification_type/M_通知区分'

    def __str__(self) -> str:
        return "{}:{}".format(self.notification_type_id, self.notification_type_nm)


class NotificationRecord(BaseModel):
    """
    T_通知記録
    """
    request = models.ForeignKey(Request, on_delete=models.CASCADE, null=True, related_name='notification_records',
                                verbose_name='request/申請')
    emp = models.ForeignKey(User, on_delete=models.CASCADE,
                            verbose_name='emp/社員')
    notification_type = models.ForeignKey(NotificationType, on_delete=models.CASCADE,
                                          verbose_name='notification_type/通知区分')
    confirm_dt = models.DateTimeField(null=True, blank=True, editable=True,
                                      verbose_name='confirm_dt/確認日時')
    
    class Meta:
        db_table = 't_notification_record'
        verbose_name_plural = 't_notification_record/T_通知記録'

    def __str__(self) -> str:
        
        return "{}:{}:{}".format(self.request, self.emp, self.notification_type)

