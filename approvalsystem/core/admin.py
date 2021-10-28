from django.contrib import admin

from core.models import BusinessUnit, Department, Segment, Division, \
    Request, ApprovalRoute, ApprovalRouteDetail, ApprovalPost,\
    RequestStatus, Property


class ApprovalRouteInline(admin.TabularInline):
    model = ApprovalRoute


class ApprovalRouteDetailInline(admin.TabularInline):
    model = ApprovalRouteDetail


class ApprovalRouteAdmin(admin.ModelAdmin):
    inlines = [ApprovalRouteDetailInline]


class RequestAdmin(admin.ModelAdmin):
    inlines = [ApprovalRouteInline]


class RequestAdmin(admin.ModelAdmin):
    model = RequestStatus


class PropertyAdmin(admin.ModelAdmin):
    model = Property


admin.site.register(BusinessUnit)
admin.site.register(Department)
admin.site.register(Segment)
admin.site.register(Division)
admin.site.register(Request, RequestAdmin)
admin.site.register(ApprovalRoute, ApprovalRouteAdmin)
admin.site.register(ApprovalPost)
admin.site.register(RequestStatus, RequestAdmin)
admin.site.register(Property)