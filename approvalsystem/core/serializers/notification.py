from rest_framework import serializers
from core.models import Notification
from django.utils.translation import gettext_lazy as _


class NotificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Notification
        fields = [
            'notification_id',
            'notification',
            'delete_flag',
        ]
