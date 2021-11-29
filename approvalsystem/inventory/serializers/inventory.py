from rest_framework import serializers
from inventory.models import Inventory, Location, StockOnHand


class InventorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Inventory
        fields = [
            'inventory_id',
            'inventory_code',
            'inventory_name',
            'is_active',
        ]

class LocationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Location
        fields = [
            'location_id',
            'location_name',
            'location_address',
        ]

class StockOnHandSerializer(serializers.ModelSerializer):
    class Meta:
        model = StockOnHand
        fields = [
            'inventory',
            'location',
            'qty_on_hand',
            'qty_on_order',
            'qty_request',
        ]
