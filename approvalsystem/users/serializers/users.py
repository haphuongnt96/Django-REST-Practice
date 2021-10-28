from rest_framework import serializers
from django.contrib.auth.hashers import make_password, check_password
import re

from users.models import User
from .em_affiliation import EmpAffiliationSerializer


class UserDetailSerializer(serializers.ModelSerializer):
    affiliations = EmpAffiliationSerializer(many=True, source='affiliations_fetchall')

    class Meta:
        model = User
        fields = [
            'id',
            'emp_cd',
            'emp_nm',
            'email',
            'affiliations',
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
        newpass_re_err_message = '「英小文字」「英大文字」「数字」「記号」の中で3種類上、8文字以上30文字以内で入力してください'
        oldpass_err_message = '現在のパスワードが正しくありません'

        #正規表現チェック
        low_up_num = '\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,30}\Z'
        low_up_sym = '\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[!?@#$%&*,.+_=\-~])[!-~]{8,30}\Z'
        up_num_sym = '\A(?=.*[A-Z])(?=.*?\d)(?=.*?[!?@#$%&*,.+_=\-~])[!-~]{8,30}\Z'
        low_num_sym = '\A(?=.*?[a-z])(?=.*?\d)(?=.*?[!?@#$%&*,.+_=\-~])[!-~]{8,30}\Z'

        # oldpassと新パスワードが一致の場合
        if data['newPassword'] == data['oldPassword']:
            raise serializers.ValidationError({"detail": newpass_err_message})
        
        # 新しいPassと確認用Pass一致チェック
        if data['newPassword'] != data['confirmPassword']:
            raise serializers.ValidationError({"detail": newconfirmpass_err_message})

        #　正規表現チェック    
        if not re.search(low_up_num, data['newPassword']) \
        and not re.search(low_up_sym, data['newPassword']) \
        and not re.search(up_num_sym, data['newPassword']) \
        and not re.search(low_num_sym, data['newPassword']):
            raise serializers.ValidationError({"detail": newpass_re_err_message})       
        
        #パスワードチェック
        user = self.context['request'].user
        oldPassword = data['oldPassword']
        if not user.check_password(oldPassword):
            raise serializers.ValidationError({"detail": oldpass_err_message})
        return data

    def get_object(self):
        return self.request.user