from rest_framework import serializers
from django.contrib.auth.hashers import make_password, check_password
import re

from users.models import User


class UserDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = [
            'id',
            'emp_cd',
            'emp_nm',
            'email',
        ]

class UserPassSerializer(serializers.Serializer):

    '''
    パスワード変更用serializer
    '''
    oldPassword = serializers.CharField()
    newPassword = serializers.CharField()
    confirmPassword = serializers.CharField()
    
    def validate(self, data):
        '''
        入力チェック
        '''
        # oldpassチェック
        #self.object = self.get_object()
        #if not self.object.check_password(oldPassword):
        #    raise serializers.ValidationError({"oldPassword": "現在のパスワードが間違っています。"})
        
        # 新しいPassと確認用Pass一致チェック
        if data['newPassword'] != data['confirmPassword']:
            raise serializers.ValidationError({"confirmPassword": "新しいパスワード・新しいパスワード（確認）が一致していません"})

        #　新しいPassと確認用Pass正規チェック
        pattern = '^((?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])|(?=.*[a-z])(?=.*[A-Z])(?=.*[!@;:])|(?=.*[A-Z])(?=.*[0-9])(?=.*[!@;:])|(?=.*[a-z])(?=.*[0-9])(?=.*[!@;:]))([a-zA-Z0-9!@;:]){8,}$'
        if not re.search(pattern, data['newPassword']):
            raise serializers.ValidationError({"newPassword": "新しいパスワードが大文字小文字数字記号3種類以上　8桁以上30文字以内ではありません。"})
        return data