from rest_framework.generics import UpdateAPIView
from rest_framework import generics

from users.models import User
from users.serializers import UserPassSerializer

class ChangePassAPI(generics.UpdateAPIView):
    queryset = User.objects.all()
    print(queryset)
    serializer_class = UserPassSerializer

    def get_object(self):
        return self.request.user


        