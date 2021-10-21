from functools import partial
from rest_framework.generics import UpdateAPIView
from rest_framework import generics, status, permissions
from rest_framework.response import Response

from users.models import User
from users.serializers import UserPassSerializer

class ChangePassAPI(generics.UpdateAPIView):
    success_message = 'パスワードが変更されました'

    # 認証済みの場合アクセス許可
    permission_classes = (permissions.IsAuthenticated, )
    serializer_class = UserPassSerializer
    model = User
    
    def put(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        
        if serializer.is_valid():
            # 入力検証OK
            self.object = self.get_object()
            oldPassword = serializer.data.get("oldPassword")
            self.object.set_password(serializer.data.get("newPassword"))
            self.object.save()
            return Response({'detail': (self.success_message)})
            
        else:
            # 入力チェックエラー
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def get_object(self):
        return self.request.user


        