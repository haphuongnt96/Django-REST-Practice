# -*- coding: utf-8 -*-
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.exceptions import TokenError
from django.contrib.auth import logout as session_logout
from django.utils.translation import gettext_lazy as _
from rest_framework.permissions import IsAuthenticated

from users.models import JWTAccessToken


class TokenRevokeView(APIView):
    '''
    Token取消処理
    '''
    error_message = 'ログアウト出来ませんでした'
    success_message = 'ログアウトに成功しました'

    def post(self, request, *args, **kwargs):
        try:
            # ヘッダーの中からスペースやタブ等で自動的に区切る(split()) HTTP_AUTHORIZATIONは、Tokenがセットされている -1で最後の要素を取得する　[Bearer token情報]
            # これでtoken情報だけを取得することができる
            #　ここでブラックリストに登録が必要なのは、期間の長いrefreshtokenでは？
            access_token = JWTAccessToken(str(request.META.get('HTTP_AUTHORIZATION')).split()[-1])
            access_token.blacklist()
        except TokenError:
            # ログアウト処理に失敗した時
            return Response({'detail': _(self.error_message)}, status=status.HTTP_401_UNAUTHORIZED)
        # Djangoのauthsessinもログアウト処理する
        session_logout(request)
        return Response({'detail': _(self.success_message)})
