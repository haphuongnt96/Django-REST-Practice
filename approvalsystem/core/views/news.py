from rest_framework.generics import ListAPIView
from django.shortcuts import get_object_or_404
from django.utils.translation import gettext_lazy as _
from core.models import News
from core.serializers import NewsSerializer


class NewsGetListAPI(ListAPIView):
    queryset = News.objects.all()
    serializer_class = NewsSerializer

    def get_queryset(self):
        queryset = super().get_queryset()
        return queryset.filter(delete_flag=False)   