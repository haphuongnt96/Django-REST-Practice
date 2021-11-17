from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as DjangoUserAdmin
from django.utils.translation import gettext_lazy as _

from .models import User, EmpAffiliation


class EmpAffiliationInline(admin.TabularInline):
    model = EmpAffiliation
    


@admin.register(User)
class UserAdmin(DjangoUserAdmin):
    """UI for User model."""
    ordering = ("email", )
    inlines = [EmpAffiliationInline]
    list_display = (
        'emp_cd',
        'emp_nm',
        'email',
        'deleted_flg',
        'is_staff',
        'is_superuser',
    )
    list_display_links = (
        'emp_cd',
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': (
                'emp_cd',
                'emp_nm',
                'email',
                'password1',
                'password2'),
        }),
    )
    fieldsets = (
        (None, {
            'fields': (
                'emp_cd',
                'password'
            )
        }),
        (_('Personal info'), {
            'fields': (
                'emp_nm',
                'email',
                'deleted_flg',
            )
        }),
        (_('Permissions'), {
            'fields': (
                'is_active',
                'is_staff',
                'is_superuser',
                'groups',
                'user_permissions'
            )
        }),
        (_('Important dates'), {
            'fields': (
                'created',
                'modified'
            )
        }),
    )
    readonly_fields = DjangoUserAdmin.readonly_fields + (
        'created',
        'modified',
    )
