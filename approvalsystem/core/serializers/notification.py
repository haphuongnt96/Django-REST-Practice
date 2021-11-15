from rest_framework import serializers
from django.db import models
from django.db.models import F

from core.models import NotificationRecord, NotificationType, Request, Notifier
from users.serializers import UserDetailSerializer
from .request import RequestSerializer


class NotificationTypeSerializer(serializers.ModelSerializer):
    """
    通知区分のシリアライザ
    """
    class Meta:
        model = NotificationType
        fields = [
            'notification_type_id',
            'notification_type_nm',
        ]


class NotificationRecordSerializer(serializers.ModelSerializer):
    """
    通知記録のシリアライザ
    """
    request = RequestSerializer(read_only=True)
    emp = UserDetailSerializer(read_only=True)
    notification_type = NotificationTypeSerializer(read_only=True)

    class Meta:
        model = NotificationRecord
        fields = [
            'request',
            'emp',
            'notification_type',
        ]


class CustomListNotifierSerializer(serializers.ListSerializer):
    """
    Custom ListSerializer for changing behavior of queryset (like filter, annotate..)
    for model Notifier (table t_notifier)
    """
    def to_representation(self, data):
        if isinstance(data, (models.Manager, models.QuerySet)):
            data = data.annotate(
                notifier_em_nm=F('emp__notifier_em_nm'),
            )
        return super().to_representation(data)


class NotifierSerializer(serializers.ModelSerializer):
    notify_emp_nm = serializers.CharField(read_only=True)

    class Meta:
        model = Notifier
        list_serializer_class = CustomListNotifierSerializer
        fields = [
            'notify_emp_id',
            'notify_emp_nm',
            'confirm_dt',
        ]


class NotificationRequestSerializer(serializers.ModelSerializer):
    """
    通知記録の申請一覧のシリアライザ
    """
    class Meta:
        model = Request
        fields = [
            'request_id',
        ]
