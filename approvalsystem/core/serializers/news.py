from rest_framework import serializers
from core.models import News
from django.utils.translation import gettext_lazy as _


class NewsSerializer(serializers.ModelSerializer):
    class Meta:
        model = News
        fields = [
            'news_id',
            'news',
            'delete_flag',
        ]
