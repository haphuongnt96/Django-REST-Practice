# -*- coding: utf-8 -*-
import json
from django.test import RequestFactory
import pytest

from django.urls import reverse

from users.views import UserListAPI as SUT


@pytest.mark.django_db
class TestUserListAPI():
    @pytest.mark.parametrize(('data'), [
        {'emp_nm': ''},
        {},
    ])
    def test_all(self, data, rf, mocker):
        """結果が全件の場合
        """
        url = reverse('user.list')
        # パラメータ指定
        request = rf.get(url, data)
        response = SUT.as_view()(request).render()

        assert response.status_code == 200
        body = json.loads(response.content)['data']
        assert len(body) == 4

    @pytest.mark.parametrize(('data'), [
        {'emp_nm': 'あいうえおお'},
        {'department_id': 'XXX'},
        {'division_id': 'XX'},
    ])
    def test_not_found(self, data, rf, mocker):
        """結果が０件の場合
        """
        url = reverse('user.list')
        # パラメータ指定
        request = rf.get(url, data)
        response = SUT.as_view()(request).render()

        assert response.status_code == 200
        body = json.loads(response.content)['data']
        assert len(body) == 0

    @pytest.mark.parametrize(('data'), [{'emp_nm': 'あいうえお'}])
    def test_filter_equals_emp_nm(self, data, rf, mocker):
        """社員名が完全一致する場合
        """
        url = reverse('user.list')
        # パラメータ指定
        request = rf.get(url, data)
        response = SUT.as_view()(request).render()

        assert response.status_code == 200
        body = json.loads(response.content)['data']
        assert len(body) == 1
        assert body[0]['emp_nm'] == 'あいうえお'

    @pytest.mark.parametrize(('data'), [{'emp_nm': 'あいうえ'}])
    def test_filter_prefix_match_emp_nm(self, data, rf, mocker):
        """社員名が前方一致する場合
        """
        url = reverse('user.list')
        # パラメータ指定
        request = rf.get(url, data)
        response = SUT.as_view()(request).render()

        assert response.status_code == 200
        body = json.loads(response.content)['data']
        assert len(body) == 1
        assert body[0]['emp_nm'] == 'あいうえお'

    @pytest.mark.parametrize(('data'), [{'department_id': '100'}])
    def test_filter_equals_department_id(self, data, rf, mocker):
        """部が完全一致する場合
        TODO: insert into m_emp_affiliation(created,modified,emp_affiliation_id,emp_id,business_unit_id,department_id,segment_id,division_id,main_flg) values 
    ('2021/11/09 14:48:07.595','2021/11/09 14:48:07.595',1,2,null,'100',null,'01',True);
        """
        url = reverse('user.list')
        # パラメータ指定
        request = rf.get(url, data)
        response = SUT.as_view()(request).render()

        assert response.status_code == 200
        body = json.loads(response.content)['data']
        assert len(body) == 1
        assert body[0]['emp_nm'] == 'あいうえお'

    @pytest.mark.parametrize(('data'), [{'division_id': '01'}])
    def test_filter_equals_division_id(self, data, rf, mocker):
        """課が完全一致する場合
        TODO: insert into m_emp_affiliation(created,modified,emp_affiliation_id,emp_id,business_unit_id,department_id,segment_id,division_id,main_flg) values 
    ('2021/11/09 14:48:07.595','2021/11/09 14:48:07.595',1,2,null,'100',null,'01',True);
        """
        url = reverse('user.list')
        # パラメータ指定
        request = rf.get(url, data)
        response = SUT.as_view()(request).render()

        assert response.status_code == 200
        body = json.loads(response.content)['data']
        assert len(body) == 1
        assert body[0]['emp_nm'] == 'あいうえお'
