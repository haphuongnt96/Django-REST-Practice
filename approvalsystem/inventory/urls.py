from django.urls import path

from .views import (
#     CountSummaryApprovalRouteDetailAPI,
#     ApprovalRequestAPI,
#     ApprovalRouteCommentListAPI,
#     ApprovalRouteCommentAPI,
#     RequestGetListAPI,
#     RegisterRequestAPI,
#     RetrieveUpdateRequestAPI,
#     ApprovalTypeListAPI,
#     ApprovalTypeDetailAPI,
#     PropertyGetListAPI,
#     ApprovalTypeGetListAPI,
#     NewsGetListAPI,
#     NotificationApplicantAPI,
#     RequestNotificationCountAPI,

    PostNewInventoryAPI,
    InteractInventoryAPI,
    PostNewLocationAPI,
    CreatePurchaseOrder,
    PurchaseOrderListing,
    SubmitPurchaseOrder,
    UpdatePurchaseOrder,
    #InteractStockOnHandAPI,
)

urlpatterns = [
    path('inventories', PostNewInventoryAPI.as_view(), name='inventory.post'),
    path('inventories/<int:inventory_id>', InteractInventoryAPI.as_view(), name='inventory.interact'),
    path('purchase-orders', CreatePurchaseOrder.as_view(), name='purchase_order.create'),
    path('purchase-orders/<int:purchase_order_id>', UpdatePurchaseOrder.as_view(), name = 'purchase_order.update'),
    path('purchase-orders/<int:purchase_order_id>/submit', SubmitPurchaseOrder.as_view(), name='purchase_order.submit'),
    path('purchase-orders/listing', PurchaseOrderListing.as_view(), name='purchase-order.list'),
    path('locations', PostNewLocationAPI.as_view(), name='location.post'),
    # 申請一覧
#     path('requests', RegisterRequestAPI.as_view(), name='request.register'),
#     path('requests/<int:request_id>',
#          RetrieveUpdateRequestAPI.as_view(), name='request.detail'),
#     path('requests/<int:request_id>/approval',
#          ApprovalRequestAPI.as_view(), name='request.approval'),
#     path('requests/get_list',
#          RequestGetListAPI.as_view(), name='requests_list'),

#     path('approval_route_details/summary/count',
#          CountSummaryApprovalRouteDetailAPI.as_view(), name='approval_route_details.summary.count'),
#     path('approval_routes/<int:request_id>/approval_route_comment',
#          ApprovalRouteCommentListAPI.as_view(), name='request.approval_route_comment'),
#     path('approval_routes/<int:request_id>/create/approval_route_comment',
#          ApprovalRouteCommentAPI.as_view(), name='request.approval_route_comment.save'),
#     path('approval_types',
#          ApprovalTypeListAPI.as_view(), name='approval_types'),
#     path('approval_types/<str:approval_type_id>',
#          ApprovalTypeDetailAPI.as_view(), name='approval_types.detail'),
#     # 物件選択
#     path('property/get_list',
#          PropertyGetListAPI.as_view(), name='property_list'),
#     # 申請内容選択
#     path('approval_types_select/get_list',
#          ApprovalTypeGetListAPI.as_view(), name='approval_types'),
#     # お知らせ
#     path('news/get_list',
#           NewsGetListAPI.as_view(), name='news_list'), 
#     # 通知
#     path('notification/applicant/<int:emp_id>', 
#           NotificationApplicantAPI.as_view(), name='notification.applicant'),
#     path('request_notifications/get_count',
#           RequestNotificationCountAPI.as_view(), name='get_request_notifications_count'),

]
