from django.urls import path

from .views import (
    ApprovalRouteListAPI,
    CountSummaryApprovalRouteDetailAPI,
    ApprovalRequestAPI,
    ApprovalRouteCommentListAPI
    RequestGetListAPI,
)

urlpatterns = [
    path('requests/<int:request_id>/approval_routes',
         ApprovalRouteListAPI.as_view(), name='request.approval_routes'),
    path('requests/<int:request_id>/approval',
         ApprovalRequestAPI.as_view(), name='request.approval'),
    path('approval_route_details/summary/count',
         CountSummaryApprovalRouteDetailAPI.as_view(),
         name='approval_route_details.summary.count'),
    path('approval_routes/<int:approval_route_id>/approval_route_comment',
          ApprovalRouteCommentListAPI.as_view(), name='request.approval_route_comment')
    path('requests/get_list',
          RequestGetListAPI.as_view(),
          name='requests_list'
    )
]
