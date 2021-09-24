from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.contrib.auth.models import UserManager as DjangoUserManager
from django.core.exceptions import ValidationError
from django.db import models
from django.db.models import Max
from django.utils.translation import gettext_lazy as _

from utils.base_model import BaseModel


class UserManager(DjangoUserManager):
    """Adjusted user manager that works w/o `username` field."""

    def _create_user(self, emp_nm, password, **extra_fields):
        """Create and save a user with the given email and password."""
        if 'email' in extra_fields:
            extra_fields['email'] = self.normalize_email(extra_fields['email'])
        user = self.model(emp_nm=emp_nm, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, emp_nm, password=None, **extra_fields):
        """Create superuser instance (used by `createsuperuser` cmd)."""
        extra_fields.setdefault("is_staff", True)
        extra_fields.setdefault("is_superuser", True)

        if extra_fields.get("is_staff") is not True:
            raise ValueError("Superuser must have is_staff=True.")
        if extra_fields.get("is_superuser") is not True:
            raise ValueError("Superuser must have is_superuser=True.")

        return self._create_user(emp_nm, password, **extra_fields)


def validate_emp_cd(value):
    """
    Check emp_cd is sequence numbers
    """
    value = str(value)
    if not value.isdigit():
        raise ValidationError(
            _('Employee code must be a sequence numbers.')
        )
    return value


class User(
    AbstractBaseUser,
    PermissionsMixin,
    BaseModel,
):
    """Custom user model without username."""

    emp_cd = models.CharField(
        max_length=7, unique=True, blank=True,
        validators=[validate_emp_cd],
        verbose_name=_('Employee code')
    )
    emp_nm = models.CharField(
        verbose_name=_('Employee name'),
        max_length=10,
    )
    deleted_flg = models.BooleanField(default=False)
    email = models.EmailField(
        max_length=254,
        blank=True,
        null=True,
        unique=True,
    )
    is_staff = models.BooleanField(
        verbose_name=_('Staff status'),
        default=False,
        help_text=_(
            'Designates whether the user can log into this admin site.'
        ),
    )
    is_active = models.BooleanField(
        verbose_name=_('Active'),
        default=True,
        help_text=_(
            'Designates whether this user should be treated as active.'
        ),
    )

    EMAIL_FIELD = 'email'
    USERNAME_FIELD = 'emp_cd'
    REQUIRED_FIELDS = [
        'emp_nm'
    ]

    objects = UserManager()

    class Meta:
        db_table = 'm_emp'
        verbose_name = _("User")
        verbose_name_plural = _("Users")

    def save(self, *args, **kwargs):
        if not self.emp_cd:
            max_emp_cd = User.objects.aggregate(Max('emp_cd'))['emp_cd__max']
            max_emp_cd = int(max_emp_cd) if max_emp_cd else 0
            self.emp_cd = str(max_emp_cd + 1)
        self.emp_cd = self.emp_cd.zfill(7)
        return super().save(*args, **kwargs)

    def __str__(self):
        return f'{self.emp_cd} - {self.emp_nm}'
