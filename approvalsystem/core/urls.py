from django.urls import path

from .views import (
    ApprovalRouteListAPI,
    CountSummaryApprovalRouteDetailAPI,
    ApprovalRequestAPI,
    ApprovalRouteCommentListAPI,
    RequestGetListAPI,
    ApprovalTypeListAPI,
    PropertyGetListAPI,
)

urlpatterns = [
    path('requests/<int:request_id>/approval_routes',
         ApprovalRouteListAPI.as_view(), name='request.approval_routes'),
    path('requests/<int:request_id>/approval',
         ApprovalRequestAPI.as_view(), name='request.approval'),
    path('approval_route_details/summary/count',
         CountSummaryApprovalRouteDetailAPI.as_view(), name='approval_route_details.summary.count'),
    path('approval_routes/<int:approval_route_id>/approval_route_comment',
         ApprovalRouteCommentListAPI.as_view(), name='request.approval_route_comment'),
    path('requests/get_list',
         RequestGetListAPI.as_view(), name='requests_list'),
    path('approval_types',
         ApprovalTypeListAPI.as_view(), name='approval_types'),
    path('property/get_list',
          PropertyGetListAPI.as_view(), name='property_list'),
]
