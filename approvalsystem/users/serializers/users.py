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
        newpass_err_message = '変更後のパスワードが変更前と同一です'
        newconfirmpass_err_message = '新しいパスワード・新しいパスワード（確認）が一致していません'
        newpass_re_err_message = '新しいパスワードが大文字小文字数字記号3種類以上　8桁以上30文字以内ではありません。'
        oldpass_err_message = '現在のパスワードが正しくありません'

        #正規表現チェック
        low_up_num = '(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]){8,30}$'
        low_up_sym = '(?=.*[a-z])(?=.*[A-Z])(?=.*[!?"#$%&amp;*()+-=^~@`&lt;&gt;;:,./|_]){8,30}$'
        up_num_sym = '(?=.*[A-Z])(?=.*[0-9])(?=.*[!?"#$%&amp;*()+-=^~@`&lt;&gt;;:,./|_]){8,30}$'
        low_num_sym = '(?=.*[a-z])(?=.*[0-9])(?=.*[!?"#$%&amp;*()+-=^~@`&lt;&gt;;:,./|_]){8,30}$'

        # oldpassと新パスワードが一致の場合
        if data['newPassword'] == data['oldPassword']:
            raise serializers.ValidationError({"detail": newpass_err_message})
        
        # 新しいPassと確認用Pass一致チェック
        if data['newPassword'] != data['confirmPassword']:
            raise serializers.ValidationError({"detail": newconfirmpass_err_message})

        #　新しいPassと確認用Pass正規チェック
        if not re.search(low_up_num, data['newPassword']) \
        and not re.search(low_up_sym, data['newPassword']) \
        and not re.search(up_num_sym, data['newPassword']) \
        and not re.search(low_num_sym, data['newPassword']):
            print('NNNN')
            raise serializers.ValidationError({"detail": newpass_re_err_message})       

        #パスワードチェック
        user = self.context['request'].user
        oldPassword = data['oldPassword']
        if not user.check_password(oldPassword):
            raise serializers.ValidationError({"detail": oldpass_err_message})
        return data

    def get_object(self):
        return self.request.user