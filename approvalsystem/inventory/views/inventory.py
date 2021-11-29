from rest_framework.generics import CreateAPIView, RetrieveUpdateAPIView, RetrieveUpdateDestroyAPIView
from rest_framework import status
from rest_framework.response import Response

from inventory.models import Inventory, Location
from inventory.serializers import *

class PostNewInventoryAPI(CreateAPIView):
    serializer_class = InventorySerializer

class InteractInventoryAPI(RetrieveUpdateDestroyAPIView):
    queryset = Inventory.objects.all()
    serializer_class = InventorySerializer
    lookup_field = 'inventory_id'

class PostNewLocationAPI(CreateAPIView):
    serializer_class = LocationSerializer

class InteractLocationAPI(RetrieveUpdateDestroyAPIView):
    queryset = Location.objects.all()
    serializer_class = LocationSerializer
    lookup_field = 'location_id'
