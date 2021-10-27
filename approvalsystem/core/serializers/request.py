from rest_framework import serializers
from django.utils.translation import gettext_lazy as _

from core.models import Request

class RequestSerializer(serializers.ModelSerializer):
    class Meta:
        model = Request
        fields = [
            'request_id',
            'title',
            'status',
        ]