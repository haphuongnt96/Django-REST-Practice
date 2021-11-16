from enum import Enum


class NotificationType(Enum):
    """
    通知区分
    """
    # 不在
    ABSENCE = '01'
    # 最終承認済
    APPROVED = '02'
    # 差戻
    REMAND = '03'
    # 申請取消
    CANCELLATION = '04'
    # コメント有
    COMMENT = '09'


class RequestStatus(Enum):
    """
    依頼ステータス区分
    """
    # 下書き
    DRAFT = '1'
    # 申請中
    APPLYING = '2'
