from rest_framework import serializers
from inventory.models import PurchaseOrder, PurchaseOrderDetail
from inventory.serializers import LocationSerializer, InventorySerializer


class PurchaseOrderDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = PurchaseOrderDetail
        fields = [
            'purchase_order_id',
            'purchase_order_line_item_no',
            'inventory',
            'order_qty',
        ]

class PurchaseOrderSerializer(serializers.ModelSerializer):
    ship_to_location = LocationSerializer(read_only = True)
    purchase_order_detail = PurchaseOrderDetailSerializer(many=True)
    class Meta:
        model = PurchaseOrder
        fields = [
            'purchase_order_id',
            'ship_to_location',
            'purchase_order_detail'
        ]

class PurchaseOrderVoucherSerializer(serializers.ModelSerializer):
    purchase_order_detail = PurchaseOrderDetailSerializer(many=True)

    class Meta:
        model = PurchaseOrder
        fields = [
            'purchase_order_id',
            'ship_to_location',
            'purchase_order_detail',
        ]

    def create(self, validated_data):
        """
            Custom func for creating nested serializer 
        """
        purchase_order_detail = validated_data.pop('purchase_order_detail')

        # Create purchase order header (draft)
        purchase_order = PurchaseOrder.objects.create(**validated_data)

        # Create purchase order detail (draft)
        for detail in purchase_order_detail:
            #detail['purchase_order_id'] = purchase_order.purchase_order_id
            PurchaseOrderDetail.objects.create(purchase_order=purchase_order,**detail)
             
        return purchase_order
        