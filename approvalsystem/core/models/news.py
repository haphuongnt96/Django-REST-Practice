from utils.base_model import BaseModel
from django.db import models


class News(BaseModel):
    """
    お知らせ
    """
    news_id = models.IntegerField(primary_key=True)
    news = models.CharField(max_length=200)
    delete_flag = models.BooleanField(default=False)

    class Meta:
        db_table = 'm_news'
        verbose_name_plural = 'm_news/M_お知らせ'