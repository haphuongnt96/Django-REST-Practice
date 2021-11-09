from django.urls import path
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

from .views import (
    TokenRevokeView, UserInfoAPI, ChangePassAPI,
    EmpAffiliationListAPI, OrganizationListAPI,
)

urlpatterns = [
    path('auth/login/', TokenObtainPairView.as_view(), name='token.login'),
    path('auth/refresh/', TokenRefreshView.as_view(), name='token.refresh'),
    path('auth/logout/', TokenRevokeView.as_view(), name='token.logout'),

    path('user/info/', UserInfoAPI.as_view(), name='user.info'),
    path('user/changepass/', ChangePassAPI.as_view(), name='user.passchange'),
    path('emp_affiliations', EmpAffiliationListAPI.as_view(), name='em_affiliations.list'),
    path('organizations', OrganizationListAPI.as_view(), name='organizations.list'),
]
