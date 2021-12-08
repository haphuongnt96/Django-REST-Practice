from django.http.response import Http404
from rest_framework.generics import CreateAPIView, RetrieveUpdateAPIView, DestroyAPIView, ListAPIView, RetrieveUpdateDestroyAPIView, UpdateAPIView, get_object_or_404
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

class UpdatePurchaseOrder(RetrieveUpdateDestroyAPIView):
    queryset = PurchaseOrder.objects.all()
    serializer_class = PurchaseOrderVoucherSerializer
    lookup_field = "purchase_order_id"

class PurchaseOrderListing(ListAPIView):
    serializer_class = PurchaseOrderSerializer

    queryset = PurchaseOrder.objects.all()


class SubmitPurchaseOrder(APIView):
    def get_object_inventory(self, inventory, location):
        queryset = StockOnHand.objects.all()
        filter = {"inventory": inventory, "location": location}        
        obj = get_object_or_404(queryset, **filter)
        return obj

    def get_object_purchase_order(self, purchase_order_id):
        queryset = PurchaseOrder.objects.all()
        filter = {"purchase_order_id": purchase_order_id}
        obj = get_object_or_404(queryset, **filter)
        return obj

    def put(self, request, *args, **kwargs):
        # Update purchase order voucher (hdr + det)
        purchase_order_id = kwargs['purchase_order_id']
        purchase_order_object = self.get_object_purchase_order(purchase_order_id)
        purchase_order_serializer = PurchaseOrderVoucherSerializer(purchase_order_object, data=self.request.data)

        if purchase_order_serializer.is_valid():
            purchase_order_serializer.save()

            # Update PO voucher status to Outstanding
            purchase_order_object.status = "O"
            purchase_order_object.save()
            
            data = purchase_order_serializer.validated_data
            # Update Stock on Hand qty on order
            purchase_order_detail = data.pop('purchase_order_detail')
            po_detail_summary = {}
            for poDetail in purchase_order_detail:
                if poDetail['inventory'] in po_detail_summary:
                    po_detail_summary[poDetail['inventory']] += poDetail['order_qty']
                else:
                    po_detail_summary[poDetail['inventory']] = poDetail['order_qty']
            
            for inventory in po_detail_summary:
                instance = self.get_object_inventory(inventory, data['ship_to_location'])
                instance.qty_on_order += po_detail_summary[inventory]
                instance.save()

            return Response(purchase_order_serializer.data)
        else:
            return Response(purchase_order_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        