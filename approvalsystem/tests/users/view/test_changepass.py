# -*- coding: utf-8 -*-
import pytest
from django.urls import reverse

from users.views import ChangePassAPI as SUT


@pytest.mark.django_db
class TestChangePassAPI():
    @pytest.mark.parametrize(('data'), [{
            'oldPassword': 'aitest0987',
            'newPassword': 'aitest0987@',
            'confirmPassword': 'aitest0987@',
        }])
    def test_changepass(self, data, rf, mocker):
        url = reverse('user.passchange')
        # パラメータ指定
        request = rf.put(url,
            content_type='application/json',
            data=data)
        response = SUT.as_view()(request).render()

        assert response.status_code == 200
