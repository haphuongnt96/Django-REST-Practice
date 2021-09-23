from django.urls import path, include

from .views import ApprovalRouteListAPI, UpdateStatusApprovalRouteDetailAPI, \
    CountSummaryApprovalRouteDetailAPI

urlpatterns = [
    path('requests/<int:request_id>/approval_routes',
         ApprovalRouteListAPI.as_view(), name='approval_routes'
         ),
    path('approval_route_details/<int:detail_no>/approval_status',
         UpdateStatusApprovalRouteDetailAPI.as_view(),
         name='approval_route_details.update_approval_status'),
    path('approval_route_details/summary/count',
         CountSummaryApprovalRouteDetailAPI.as_view(),
         name='approval_route_details.summary.count'),
]
