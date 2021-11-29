from ..models.purchase_order import PurchaseOrder, PurchaseOrderDetail

def get_purchase_order():
    """
        List all purchase orders and their line item details
    """

    queryset = PurchaseOrder.objects.raw('''
    SELECT
        *
    FROM
        p_purchase_order_hdr as poHdr
    INNER JOIN
        p_purchase_order_det as poDet on poHdr.purchase_order_id = poDet.purchase_order_id
    ORDER BY
        poHdr.created desc;
    ''')

    return queryset