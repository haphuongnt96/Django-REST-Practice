# -*- coding: utf-8 -*-
from rest_framework import status
from rest_framework.renderers import JSONRenderer


class CustomJsonRenderer(JSONRenderer):
    def render(self, data, accepted_media_type=None, renderer_context=None):
        status_code = renderer_context['response'].status_code
        message = data.pop('detail', None)
        errors = None
        if status_code == status.HTTP_400_BAD_REQUEST:
            errors = data
            data = {}
        response = {
            'code': status_code,
            'data': data,
            'message': message,
            'errors': errors,
        }
        return super().render(response, accepted_media_type, renderer_context)
