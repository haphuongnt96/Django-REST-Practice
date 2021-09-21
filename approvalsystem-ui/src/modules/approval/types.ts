// eslint-disable-next-line @typescript-eslint/no-unused-vars
declare namespace Approvals {
  type ApprovalRouteResponse = {
    request_id: string
    approval_route_id: string
    approval_type_cd: string
    judgement_cd: string
    request_emp_cd: string
    request_emp_fullname: string
    approval_route_details: ApprovalRouteDetailResponse[]
  }

  type ApprovalRouteDetailResponse = {
    approval_route_id: string
    detail_no: number
    approval_post_nm: string
    required_num_approvals: number
    order: number
    notification: string
    approval_post_cd: string
    approval_emp_cd: number
    approval_emp_nm: string
    approval_status: boolean
    approval_date: string
  }
}
