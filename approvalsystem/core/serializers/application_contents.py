from rest_framework import serializers
from core.models import ApplicationClassification, ApplicationContents
from django.utils.translation import gettext_lazy as _


class ApplicationClassificationSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = ApplicationClassification
        fields = [
            'applicationclassification_id',
            'applicationclassification_nm',
        ]


class ApplicationContentsSerializer(serializers.ModelSerializer):
    applicationclassification = ApplicationClassificationSerializer(read_only=True)

    class Meta:
        model = ApplicationContents
        fields = [
            'applicationcontents_id',
            'applicationcontents_nm',
            'department',
            'segment',
            'division',
            'applicationclassification',
        ]
