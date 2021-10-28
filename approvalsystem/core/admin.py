from django.contrib import admin

from core.models import (
    Department, Segment, Division, BusinessUnit,
    Request, RequestStatus,
    ApprovalRoute, ApprovalRouteDetail, ApprovalPost,
    ApprovalType, ApprovalClass, Choices, RequestDetailMaster, ColumnType
)


class ApprovalRouteInline(admin.TabularInline):
    model = ApprovalRoute


class ApprovalRouteDetailInline(admin.TabularInline):
    model = ApprovalRouteDetail


class ApprovalRouteAdmin(admin.ModelAdmin):
    inlines = [ApprovalRouteDetailInline]


class RequestAdmin(admin.ModelAdmin):
    inlines = [ApprovalRouteInline]


class RequestStatusAdmin(admin.ModelAdmin):
    model = RequestStatus


admin.site.register(BusinessUnit)
admin.site.register(Department)
admin.site.register(Segment)
admin.site.register(Division)
admin.site.register(Request, RequestAdmin)
admin.site.register(ApprovalRoute, ApprovalRouteAdmin)
admin.site.register(ApprovalPost)
admin.site.register(RequestStatus, RequestStatusAdmin)
admin.site.register(ApprovalType)
admin.site.register(ApprovalClass)
admin.site.register(RequestDetailMaster)
admin.site.register(Choices)
admin.site.register(ColumnType)
