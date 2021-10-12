# -*- coding: utf-8 -*-
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
        
    class Meta:
        model = User
        fields = ('old_password', 'password', 'password2')
    
    def validate(self, attrs):
        '''
        新パスワード入力同一チェック
        '''
        if attrs['password'] != attrs['password2']:
            raise serializers.ValidationError({"password": "Password fields didn't match."})

        return attrs


    def new_password_check(self, new_password):
        '''
        パスワードの正規チェック
        '''
        return re.search(r'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*?\d)(?=.*?[!-/:-@[-`{-~])[0-9a-zA-Z]{8,30}', new_password)


    def old_password_check(self, value):
        '''
        chek_passwordでolo_passwordが現在データベースにあるパスワードと一致しているかチェックする
        '''
        user = self.context['user']
        if not user.chek_password(value):
            raise serializers.ValidationError(
                _('パスワードが間違っています。再入力をお願いします。')
            )
        return value

    '''
    new_passwordとold_password不一致チェック（同一ならエラー）
    '''

    def update(self, instance, validated_data):

        instance.set_password(validated_data['password'])
        instance.save()

        return instance