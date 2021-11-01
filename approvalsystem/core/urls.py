from django.urls import path

from .views import (
    CountSummaryApprovalRouteDetailAPI,
    ApprovalRequestAPI,
    ApprovalRouteCommentListAPI,
    RequestGetListAPI,
    RegisterRequestAPI,
    RetrieveUpdateRequestAPI,
    ApprovalTypeListAPI,
    ApprovalTypeDetailAPI,
    PropertyGetListAPI,
)

urlpatterns = [
    path('requests', RegisterRequestAPI.as_view(), name='request.register'),
    path('requests/<str:request_id>',
         RetrieveUpdateRequestAPI.as_view(), name='request.detail'),
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
    path('approval_types/<str:approval_type_id>',
         ApprovalTypeDetailAPI.as_view(), name='approval_types.detail'),
    path('property/get_list',
          PropertyGetListAPI.as_view(), name='property_list'),
]
