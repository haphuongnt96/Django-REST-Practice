# -*- coding: utf-8 -*-
import json
import pytest

from django.urls import reverse

from users.views import UserInfoAPI as SUT


@pytest.mark.django_db
class TestUserInfoAPI():
    def test_info(self, rf, mocker):
        url = reverse('user.info')
        # パラメータ指定
        request = rf.get(url)
        response = SUT.as_view()(request).render()

        assert response.status_code == 200
        body = json.loads(response.content)['data']
        assert body['emp_nm'] == 'あいうえお'
