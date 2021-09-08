from django_extensions.db.models import TimeStampedModel


class BaseModel(TimeStampedModel):
    """Base class models."""

    class Meta:
        abstract = True
