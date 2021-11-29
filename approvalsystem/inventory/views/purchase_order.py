from rest_framework.generics import CreateAPIView, RetrieveUpdateAPIView, DestroyAPIView, ListAPIView, UpdateAPIView
from rest_framework.views import APIView
from rest_framework import status
from rest_framework.response import Response
from django.db import transaction

from inventory.models import PurchaseOrder, PurchaseOrderDetail
from inventory.serializers.purchase_order import *
from ..sql.PurchaseOrderListing import get_purchase_order
from ..models.inventory import StockOnHand

class CreatePurchaseOrder(CreateAPIView):
    serializer_class = PurchaseOrderVoucherSerializer
    
    @transaction.atomic
    def create(self, *args, **kwargs):
        serializer = self.get_serializer(data=self.request.data)
        if serializer.is_valid():
            serializer.save()
          
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class PurchaseOrderListing(ListAPIView):
    serializer_class = PurchaseOrderSerializer

    queryset = PurchaseOrder.objects.all()


class SubmitPurchaseOrder(APIView):
    def get_object(self, inventory, location):
        queryset = StockOnHand.objects.get(inventory=inventory, location=location)
        return queryset

    def put(self, request, *args, **kwargs):
        serializer = PurchaseOrderVoucherSerializer(data=self.request.data)
        if serializer.is_valid():
            serializer.save()
            data = serializer.validated_data
            purchase_order_detail = data.pop('purchase_order_detail')
            po_detail_summary = {}
            for poDetail in purchase_order_detail:
                if poDetail['inventory'] in po_detail_summary:
                    po_detail_summary[poDetail['inventory']] += poDetail['order_qty']
                else:
                    po_detail_summary[poDetail['inventory']] = poDetail['order_qty']
            
            for inventory in po_detail_summary:
                instance = self.get_object(inventory, data['ship_to_location'])
                instance.qty_on_order += po_detail_summary[inventory]
                instance.save()

            return Response(serializer.data)

        