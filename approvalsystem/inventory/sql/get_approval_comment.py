from ..models.approval_route_comment import ApprovalRouteComment


def get_approval_comment(request_id):
    """
    該当申請IDに対するコメントを取得する。
    :param request_id: 申請ID
    """
    queryset = ApprovalRouteComment.objects.raw('''
        SELECT
            comment.*, emp.emp_nm, route.approval_type_id
        FROM
            t_approval_route_comment as comment
        INNER JOIN
            m_emp as emp ON emp.id=comment.ins_emp_id
        INNER JOIN
            t_approval_route as route
            ON route.request_id=comment.request_id AND route.approval_route_id=comment.approval_route_id
        WHERE
            comment.request_id=%(request_id)s
        ORDER BY
            comment.created desc;
    ''', {'request_id': request_id})

    return queryset