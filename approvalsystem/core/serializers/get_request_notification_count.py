from rest_framework import serializers
from django.utils.translation import gettext_lazy as _

class GetRequestNotificationCount(serializers.Serializer):
    draft = serializers.IntegerField(read_only=True, default=0)
    applying = serializers.IntegerField(read_only=True, default=0)
    remand = serializers.IntegerField(read_only=True,default=0)