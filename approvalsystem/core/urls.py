from django.urls import path, include

from .views import ApprovalRouteListAPI

urlpatterns = [
    path('api/requests/<int:request_id>/approval_routes',
         ApprovalRouteListAPI.as_view(), name='approval_routes'
         ),
]
