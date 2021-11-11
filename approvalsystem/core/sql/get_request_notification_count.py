from ..models.request import Request
from ..models.approval_route import ApprovalRoute

from django.db import connection

def dictfetchall(c):
    desc = c.description
    return [
        dict(zip([col[0] for col in desc], row))
        for row in c.fetchall()
    ]

def get_request_notification_count(request_user):
	with connection.cursor() as c:
		c.execute('''
		SELECT
			COUNT(status_count.status_id = '1' or Null) as draft,
			COUNT(status_count.status_id = '2' or Null) as Applying,
			COUNT(status_count.status_id = '8' or Null) as Remand
		FROM
			(SELECT
				request.request_id,
				request.status_id,
				MAX(route.approval_route_id) as last_approval_id
			FROM
				t_reuqest as request
				LEFT OUTER JOIN
					t_approval_route as route
				ON
					request.request_id = route.request_id_id
			WHERE
				route.request_emp_id = %(request_user)s
				AND (request.status_id = '1' OR request.status_id = '2' OR request.status_id = '8')
			GROUP BY
				request.request_id
			) as status_count;
	''', {'request_user': request_user})
		queryset = dictfetchall(c)
	return queryset
