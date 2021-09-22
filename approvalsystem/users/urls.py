from django.urls import path
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

from .views import TokenRevokeView

urlpatterns = [
    path('auth/login/', TokenObtainPairView.as_view(), name='token.login'),
    path('auth/refresh/', TokenRefreshView.as_view(), name='token.refresh'),
    path('auth/logout/', TokenRevokeView.as_view(), name='token.logout'),
]
