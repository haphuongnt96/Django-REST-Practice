# -*- coding: utf-8 -*-
from rest_framework.generics import RetrieveAPIView, ListAPIView

from users.serializers import UserDetailSerializer
from users.models import User


class UserInfoAPI(RetrieveAPIView):
    queryset = User.objects.all()
    serializer_class = UserDetailSerializer

    def get_object(self):
        return self.request.user
class UserListAPI(ListAPIView):
    queryset = User.objects.all()
    serializer_class = UserDetailSerializer

    def get_queryset(self):
        """指定した条件に一致する社員一覧を取得する
        """
        queryset = super().get_queryset()
        emp_nm = self.request.query_params.get('emp_nm', None)
        # 社員名
        if emp_nm:
            queryset = queryset.filter(emp_nm__istartswith=emp_nm)
        # 部
        department_id =  self.request.query_params.get('department_id', None)
        if department_id:
            queryset = queryset.filter(affiliations__department_id=department_id)
        # 課
        division_id =  self.request.query_params.get('division_id', None)
        if division_id:
            queryset = queryset.filter(affiliations__division_id=division_id)
        return queryset
