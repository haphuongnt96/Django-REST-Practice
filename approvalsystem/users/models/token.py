# -*- coding: utf-8 -*-
from rest_framework_simplejwt.tokens import AccessToken, BlacklistMixin


class JWTAccessToken(BlacklistMixin, AccessToken):
    pass
