from django.db.models.query import RawQuerySet
from ..models.request import Request


def get_request_emp_notification(emp_id: int, notification_type_id: str) -> RawQuerySet:
    """
    申請者の通知記録を取得する。
    Args:
        emp_id (int): 社員ID
        notification_type_id (str): 通知区分ID
    Returns:
        RawQuerySet: 通知記録がある申請の申請IDのリスト
    """
    queryset = Request.objects.raw('''
        SELECT
            t_request.request_id
        FROM
            ( 
                SELECT
                    t_request.request_id 
                FROM
                    t_request 
                    INNER JOIN t_approval_route 
                        ON t_request.request_id = t_approval_route.request_id 
                WHERE
                    t_approval_route.request_emp_id = %(emp_id)s 
                GROUP BY
                    t_request.request_id
            ) t_request 
            LEFT OUTER JOIN t_notification_record 
                ON t_request.request_id = t_notification_record.request_id 
            LEFT OUTER JOIN m_notification_type 
                ON t_notification_record.notification_type_id = m_notification_type.notification_type_id 
        WHERE
            t_notification_record.notification_type_id = %(notification_type_id)s 
        AND t_notification_record.confirm_dt IS NULL
        ORDER BY t_request.request_id
	''', {'emp_id': emp_id, 'notification_type_id': notification_type_id})

    return queryset