from django.urls import path, include

from .views import ApprovalRouteListAPI, UpdateStatusApprovalRouteDetailAPI

urlpatterns = [
    path('requests/<int:request_id>/approval_routes',
         ApprovalRouteListAPI.as_view(), name='approval_routes'
         ),
    path('approval_route_details/<int:approval_route_id>/approval_status',
         UpdateStatusApprovalRouteDetailAPI.as_view(),
         name='approval_route_details.update_approval_status')
]
