from django.db import models
from utils.base_model import BaseModel

class Inventory(BaseModel):
    inventory_id = models.AutoField(primary_key=True)
    inventory_code = models.CharField(max_length=60)
    inventory_name = models.CharField(max_length=255)
    is_active = models.BooleanField(default=True)

    class Meta:
        db_table = 'p_inventory'

class Location(BaseModel):
    location_id = models.AutoField(primary_key=True)
    location_name = models.CharField(max_length=255)
    location_address = models.CharField(max_length=2000)

    class Meta:
        db_table = 'p_location'

class StockOnHand(BaseModel):
    inventory = models.ForeignKey(Inventory, on_delete=models.PROTECT)
    location = models.ForeignKey(Location, on_delete=models.PROTECT)
    qty_on_hand = models.IntegerField()
    qty_on_order = models.IntegerField()
    qty_request = models.IntegerField()

    class Meta:
        db_table = 'p_stock_on_hand'
