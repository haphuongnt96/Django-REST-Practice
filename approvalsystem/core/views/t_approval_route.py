# -*- coding: utf-8 -*-
import json
import os

from rest_framework.views import APIView
from django.http import JsonResponse
from django.conf import settings


def read_json(path):
    abs_path = os.path.join(settings.BASE_DIR, path)
    with open(abs_path, 'rt', encoding='utf-8') as f:
        data = json.load(f)
    return data


class ApprovalRouteListAPI(APIView):
    def get(self, request, *args, **kwargs):
        approval_route = read_json('mockup/core/t_approval_route.json')
        approval_route_details = read_json('mockup/core/t_approval_route_detail.json')
        for route in approval_route:
            route['approval_route_details'] = []
            for route_detail in approval_route_details:
                if route['approval_route_id'] == route_detail['approval_route_id']:
                    route['approval_route_details'].append(route_detail)
        return JsonResponse({'data': approval_route})
