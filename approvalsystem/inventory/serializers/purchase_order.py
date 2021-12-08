from rest_framework import serializers
from rest_framework.validators import UniqueTogetherValidator
from inventory.models import PurchaseOrder, PurchaseOrderDetail
from inventory.serializers import LocationSerializer, InventorySerializer
from django.utils import timezone

class PurchaseOrderDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = PurchaseOrderDetail
        fields = [
            'purchase_order_line_item_no',
            'inventory',
            'order_qty',
        ]
        # validators = [
        #     UniqueTogetherValidator(
        #         queryset = PurchaseOrderDetail.objects.all(),
        #         fields = ['purchase_order_id', 'purchase_order_line_item_no']
        #     )
        # ]

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
    status = serializers.SerializerMethodField()

    class Meta:
        model = PurchaseOrder
        fields = [
            'purchase_order_id',
            'status',
            'ship_to_location',
            'purchase_order_detail',
        ]
    
    def get_status(self, instance):
        return(instance.status)

    @staticmethod
    def create_or_update_purchase_order_detail(purchase_order_detail: dict):
        # defaults = {'inventory': purchase_order_detail['inventory'],
        #             'order_qty': purchase_order_detail['order_qty']}
        # try:
        #     purchase_order_detail_instance = PurchaseOrderDetail.objects.get(purchase_order_id = purchase_order_detail['purchase_order_id'], purchase_order_line_item_no = purchase_order_detail['purchase_order_line_item_no'])
        #     for key, value in defaults.items():
        #         setattr(purchase_order_detail_instance, key, value)
        #     purchase_order_detail_instance.save()
        # except PurchaseOrderDetail.DoesNotExist:
        #     obj = PurchaseOrderDetail(purchase_order_id = purchase_order_detail['purchase_order_id'], purchase_order_line_item_no = purchase_order_detail['purchase_order_line_item_no'],**defaults)
        #     obj.save()
        # shortcut:
        purchase_order_detail_instance = PurchaseOrderDetail.objects.update_or_create(
            purchase_order_id=purchase_order_detail['purchase_order_id'],
            purchase_order_line_item_no=purchase_order_detail['purchase_order_line_item_no'],
            defaults={
                'inventory': purchase_order_detail['inventory'],
                'order_qty': purchase_order_detail['order_qty']
            }
        )
    def create(self, validated_data):
        """
            Custom func for creating nested serializer 
        """
        purchase_order_details = validated_data.pop('purchase_order_detail')

        # Create purchase order header (draft)
        purchase_order = PurchaseOrder.objects.create(**validated_data)

        # Create purchase order detail (draft)
        for detail in purchase_order_details:
            #detail['purchase_order_id'] = purchase_order.purchase_order_id
            PurchaseOrderDetail.objects.create(purchase_order=purchase_order,**detail)
             
        return purchase_order
    
    def update(self, instance, validated_data):
        """
            Custom update function for creating nested serializer
        """

        purchase_order_details = validated_data.pop('purchase_order_detail')

        # Update purchase order header
        instance.ship_to_location_id = validated_data['ship_to_location']

        # Update purchase order detail
        for detail in purchase_order_details:
            detail['purchase_order_id'] = instance.purchase_order_id
            self.create_or_update_purchase_order_detail(detail)

        instance.modified = timezone.now()
        instance.save()
        return instance

    
