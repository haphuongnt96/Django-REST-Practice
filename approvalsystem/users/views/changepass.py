from functools import partial
from rest_framework.generics import UpdateAPIView
from rest_framework import generics, status, permissions
from rest_framework.response import Response

from users.models import User
from users.serializers import UserPassSerializer

class ChangePassAPI(generics.UpdateAPIView):
    print('users/views/changepass/ChangePassAPI')
    # 認証済みの場合アクセス許可
    permission_classes = (permissions.IsAuthenticated, )
    serializer_class = UserPassSerializer
    model = User
    
    def put(self, request, *args, **kwargs):
        print(request.data)
        #ログインユーザーの情報を取得。serializerをリクエストデータからインスタンス化する
        self.object = self.get_object()
        serializer = self.get_serializer(data=request.data)
        
        if serializer.is_valid():
            print('serializer is vailid')
            print(serializer)
            # 入力検証が通ったらテータの真偽を確認する。
            oldPassword = serializer.data.get("oldPassword")
            print(serializer.data.get("oldPassword"))
            print(oldPassword)
            if not self.object.check_password(oldPassword):
                print('Wrong old password')
                return Response({"oldPassword": ["Wrong password."]}, 
                                status=status.HTTP_400_BAD_REQUEST)
            else:
                self.object.set_password(serializer.data.get("newPassword"))
                self.object.save()
                print('Success Change password')
                return Response({"res": ["yes"]},
                                status=status.HTTP_204_NO_CONTENT)
            
        else:
            # 入力チェックエラーを返す
            print('serializer is vailid2')
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def get_object(self):
        return self.request.user


        