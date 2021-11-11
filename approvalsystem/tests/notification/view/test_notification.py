# -*- coding: utf-8 -*-
import json
import pytest

from django.urls import reverse

from core.views import NotificationApplicantAPI as SUT # テスト対象


@pytest.mark.django_db
class TestNotificationApplicantAPI():
    def test_info(self, rf, mocker):
        url = reverse('user.info')
        # パラメータ指定
        request = rf.get(url)
        response = SUT.as_view()(request).render()

        assert response.status_code == 200
        body = json.loads(response.content)['data']
        print(body)
        assert len(body) == 2
