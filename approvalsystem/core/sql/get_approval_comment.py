from ..models.approval_route_comment import ApprovalRouteComment


def get_approval_comment(approval_route_id):
	queryset = ApprovalRouteComment.objects.raw('''
		SELECT
			comment.*, emp.emp_nm, route.approval_type_cd
		FROM
			t_approval_route_comment as comment
		INNER JOIN
			m_emp as emp ON emp.id=comment.ins_emp_id
		INNER JOIN
			t_approval_route as route
			ON route.request_id_id=comment.request_id AND route.approval_route_id=comment.approval_route_id
		WHERE
			comment.approval_route_id=%(approval_route_id)s
		ORDER BY
			comment.created desc;
	''', {'approval_route_id': approval_route_id})

	return queryset