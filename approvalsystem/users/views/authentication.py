# -*- coding: utf-8 -*-
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.exceptions import TokenError
from django.contrib.auth import logout as session_logout
from django.utils.translation import gettext_lazy as _

from users.models import JWTAccessToken


class TokenRevokeView(APIView):
    error_message = 'Invalid or expired token.'
    success_message = 'Logged out successfully.'

    def post(self, request, *args, **kwargs):
        try:
            access_token = JWTAccessToken(str(request.META.get('HTTP_AUTHORIZATION')).split()[-1])
            access_token.blacklist()
        except TokenError:
            return Response({'message': _(self.error_message)}, status=status.HTTP_401_UNAUTHORIZED)
        session_logout(request)
        return Response({'message': _(self.success_message)})
