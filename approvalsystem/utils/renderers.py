# -*- coding: utf-8 -*-
from rest_framework import status
from rest_framework.renderers import JSONRenderer


class CustomJsonRenderer(JSONRenderer):
    '''
    Responseデータのカスタマイズ
    https://www.django-rest-framework.org/api-guide/responses/
    '''
    def render(self, data, accepted_media_type=None, renderer_context=None):
        status_code = renderer_context['response'].status_code
        message = None
        errors = None
        if isinstance(data, dict) and 'detail' in data:
            #data が辞書型　かつ　dataにdetailがある場合 messageに代入
            message = data.pop('detail')
        if status_code == status.HTTP_400_BAD_REQUEST:
            #http400の場合の処理
            errors = data
            data = {}
        #レスポンス用データの作成
        response = {
            'code': status_code,
            'data': data,
            'message': message,
            'errors': errors,
        }
        return super().render(response, accepted_media_type, renderer_context)
