from rest_framework import serializers
from core.models import ApplicationClassification, ApplicationContents
from django.utils.translation import gettext_lazy as _


class ApplicationClassificationSerializer(serializers.ModelSerializer):
    
    class Meta:
        models = ApplicationClassification
        fields = [
            'applicationclassification_id',
            'applicationclassification_nm',
        ]


class ApplicationContentsSerializer(serializers.ModelSerializer):
    applicationcontents = ApplicationClassificationSerializer(read_only=True)

    class Meta:
        models = ApplicationContents
        fields = [
            'applicationcontents_id',
            'applicationcontents_nm',
            'department',
            'segment',
            'division',
            'applicationcontents',
        ]
