# -*- coding: utf-8 -*-
from rest_framework.generics import RetrieveAPIView

from users.serializers import UserDetailSerializer
from users.models import User


class UserInfoAPI(RetrieveAPIView):
    queryset = User.objects.all()
    serializer_class = UserDetailSerializer

    def get_object(self):
        return self.request.user
