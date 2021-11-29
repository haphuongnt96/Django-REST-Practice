from django.db import models
from utils.base_model import BaseModel
from .inventory import *

class PurchaseOrder(BaseModel):
    purchase_order_id = models.AutoField(primary_key=True)
    ship_to_location = models.ForeignKey(Location, on_delete=models.PROTECT)
    status = models.CharField(max_length=1)
    
    class Meta:
        db_table = 'p_purchase_order_hdr'

class PurchaseOrderDetail(BaseModel):
    purchase_order = models.ForeignKey(PurchaseOrder, related_name='purchase_order_detail', on_delete=models.CASCADE)
    purchase_order_line_item_no = models.IntegerField()
    inventory = models.ForeignKey(Inventory, on_delete=models.CASCADE)
    order_qty = models.IntegerField()

    class Meta:
        db_table = 'p_purchase_order_det'

    