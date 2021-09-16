from django.contrib import admin

from core.models import Department, Segment, Division, \
    Request, ApprovalRoute, ApprovalRouteDetail


class ApprovalRouteInline(admin.TabularInline):
    model = ApprovalRoute


class ApprovalRouteDetailInline(admin.TabularInline):
    model = ApprovalRouteDetail


class ApprovalRouteAdmin(admin.ModelAdmin):
    inlines = [ApprovalRouteDetailInline]


class RequestAdmin(admin.ModelAdmin):
    inlines = [ApprovalRouteInline]


admin.site.register(Department)
admin.site.register(Segment)
admin.site.register(Division)
admin.site.register(Request, RequestAdmin)
admin.site.register(ApprovalRoute, ApprovalRouteAdmin)
