from rest_framework import serializers
from core.models import NotificationRecord, NotificationType, Request
from core.serializers import RequestSerializer
from users.serializers import UserDetailSerializer
from django.utils.translation import gettext_lazy as _


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

class NotificationRequestSerializer(serializers.ModelSerializer):
    """
    通知記録の申請一覧のシリアライザ
    """
    class Meta:
        model = Request
        fields = [
            'request_id',
        ]