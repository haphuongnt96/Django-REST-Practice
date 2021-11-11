from rest_framework import serializers
from django.utils.translation import gettext_lazy as _

class GetRequestNotificationCount(serializers.Serializer):
    draft = serializers.IntegerField(read_only=True)
    Applying = serializers.IntegerField(read_only=True)
    Denial = serializers.IntegerField(read_only=True)