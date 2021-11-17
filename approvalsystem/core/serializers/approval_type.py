from rest_framework import serializers
from core.models import ApprovalType
from users.serializers import SegmentSerializer, DivisionSerializer
from core.serializers import ApprovalClassSerializer
from django.utils.translation import gettext_lazy as _


class ApprovalTypeSerializer(serializers.ModelSerializer):
    """
    承認種類のシリアライザ
    """
    approval_class = ApprovalClassSerializer(read_only=True)
    segment = SegmentSerializer(read_only=True)
    division = DivisionSerializer(read_only=True)    

    class Meta:
        model = ApprovalType
        fields = [
            'approval_type_id',
            'approval_type_nm',
            'approval_class',
            'segment',
            'division',
        ]