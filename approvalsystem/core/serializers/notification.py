from rest_framework import serializers
from django.db import models
from django.db.models import F

from core.models import NotificationRecord, NotificationType, Request
from core.serializers import RequestSerializer
from users.serializers import UserDetailSerializer


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


class CustomListNotificationRecordSerializer(serializers.ListSerializer):
    """
    Custom ListSerializer for changing behavior of queryset (like filter, annotate..)
    for model NotificationRecord (table t_notification_records)
    """
    def to_representation(self, data):
        if isinstance(data, (models.Manager, models.QuerySet)):
            data = data.annotate(
                emp_nm=F('emp__emp_nm'),
                notification_type_nm=F('notification_type__notification_type_nm'),
            )
        return super().to_representation(data)


class DetailNotificationRecordSerializer(serializers.ModelSerializer):
    """
    Serializer of model NotificationRecord. Used in api get request detail.
    """
    emp_id = serializers.IntegerField(required=True)
    emp_nm = serializers.CharField(read_only=True)
    notification_type_nm = serializers.CharField(read_only=True)

    class Meta:
        model = NotificationRecord
        fields = [
            'emp_id',
            'emp_nm',
            'notification_type_id',
            'notification_type_nm',
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
