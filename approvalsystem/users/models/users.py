# -*- coding: utf-8 -*-
import re

from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.contrib.auth.models import UserManager as DjangoUserManager
from django.core.exceptions import ValidationError
from django.db import models
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
    Check emp_cd is sequence digits
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
        max_length=7, unique=True,
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
        self.emp_cd = self.emp_cd.zfill(7)
        return super().save(*args, **kwargs)

    def __str__(self):
        return f'{self.emp_cd} - {self.emp_nm}'


class AlphabetTypePasswordValidator:
    """
    Validate password has at least three type of alphabets.
    """
    special_characters = '_@$!%*#?&'
    pattern = re.compile(
        rf'(?=.*[A-Za-z])(?=.*\d)(?=.*[{special_characters}])'
    )
    error_message = f'Password must contain at least one letter, one number and' \
                    f' one special character "{special_characters}".'

    def validate(self, password, user=None):
        if not self.pattern.match(password):
            raise ValidationError(
                _(self.error_message),
                code='password_alphabet_type_required',
            )

    def get_help_text(self):
        return _(self.error_message)
