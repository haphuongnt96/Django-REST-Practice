from django.contrib import admin

from core.models import (
    Department, Segment, Division, BusinessUnit,
    Request, RequestStatus,
    ApprovalRoute, ApprovalRouteDetail, ApprovalPost,
    ApprovalRouteMaster,
    ApprovalType, ApprovalClass, Choices, RequestDetailMaster, ColumnType,
    Property
)


class ApprovalRouteInline(admin.TabularInline):
    model = ApprovalRoute


class ApprovalRouteDetailInline(admin.TabularInline):
    model = ApprovalRouteDetail


class ApprovalRouteMasterInline(admin.TabularInline):
    model = ApprovalRouteMaster


class ChoiceInline(admin.TabularInline):
    model = Choice


class RequestDetailMasterInline(admin.TabularInline):
    model = RequestDetailMaster
    show_change_link = True


class ApprovalRouteAdmin(admin.ModelAdmin):
    inlines = [ApprovalRouteDetailInline]


class ApprovalTypeAdmin(admin.ModelAdmin):
    inlines = [
        ApprovalRouteMasterInline,
        RequestDetailMasterInline,
    ]


class RequestAdmin(admin.ModelAdmin):
    inlines = [ApprovalRouteInline]


class RequestStatusAdmin(admin.ModelAdmin):
    model = RequestStatus


class PropertyAdmin(admin.ModelAdmin):
    model = Property


class RequestDetailMasterAdmin(admin.ModelAdmin):
    inlines = [
        ChoiceInline,
        RequestDetailMasterInline,
    ]


admin.site.register(BusinessUnit)
admin.site.register(Department)
admin.site.register(Segment)
admin.site.register(Division)
admin.site.register(Request, RequestAdmin)
admin.site.register(ApprovalRoute, ApprovalRouteAdmin)
admin.site.register(ApprovalPost)
admin.site.register(RequestStatus, RequestStatusAdmin)
admin.site.register(ApprovalType, ApprovalTypeAdmin)
admin.site.register(ApprovalClass)
admin.site.register(RequestDetailMaster, RequestDetailMasterAdmin)
admin.site.register(ColumnType)
admin.site.register(Property)