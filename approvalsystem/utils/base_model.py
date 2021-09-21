from abc import ABCMeta, abstractmethod
from django_extensions.db.models import TimeStampedModel

from django.conf import settings


class BaseModel(TimeStampedModel):
    """Base class models."""

    class Meta:
        abstract = True


class BaseUrlModel(BaseModel):
    """
    A mixin model for get_absolute_url()
    Replace get_url_path() for specific model's detail view.
    """
    __metaclass__ = ABCMeta

    class Meta:
        abstract = True

    @abstractmethod
    def get_url_path(self) -> str:
        """Return reverse url for model's detail view"""

    def get_absolute_url(self):
        return settings.WEBSITE_URL.strip('/') + self.get_url_path()
