// eslint-disable-next-line @typescript-eslint/no-unused-vars
declare namespace Approvals {
  type ApprovalRouteResponse = {
    approval_route_details: ApprovalRouteDetailResponse[]
    notification_records: NotificationRecords[]
    approval_route_id: string
    approval_type_cd: string
    created: string
    judgement_cd: string
    request_emp_cd: string
    request_emp_nm: string
    request_emp_fullname: string
    request_id: string
  }

  type ApprovalRouteDetailResponse = {
    approval_route_id: string
    detail_no?: number
    approval_post_nm: string
    required_num_approvals?: number
    order: number
    notification: string
    approval_post_cd: string
    approval_emp_id: number
    approval_emp_nm: string
    approval_status: boolean
    approval_date: string
    default_flg?: boolean
  }

  type ApprovalRouteCommentResponse = {
    id: number
    request_id: string
    approval_route_id: string
    approval_type_cd: string
    comment_no: number
    comment: string
    emp_nm: string
    created: string
  }

  type GetAprrovalTypesResponse = {
    approval_classes: ApprovalClass[]
    approval_types: ApprovalType[]
    divisions: ApprovalDivision[]
    segments: ApprovalSegment[]
  }

  type GetAprrovalTypeResponse = {
    m_approval_routes: ApprovalRouteResponse[]
    m_request_details: ApplicationForm.RequestDetail[]
    approval_route_details: ApprovalRouteDetailResponse[]
    notifiers: NotificationRecords[]
  }

  type ApprovalClass = {
    approval_class_id: string
    approval_class_nm: string
  }

  type ApprovalDetailFormHeader = {
    approval_type_nm: string
  }

  type ApprovalType = {
    approval_class_id: string
    approval_class_nm: string
    approval_type_id: string
    approval_type_nm: string
    division_id: string
    division_nm: string
  } & Auth.Affiliation

  type ApprovalDivision = {
    division_id: string
    division_nm: string
  }

  type ApprovalSegment = {
    segment_id: string
    segment_nm: string
  }

  type RegisterRequest = {
    request_column_id: string
    request_column_val: string
  }

  type SendRequestParams = {
    approval_type_id: string
    request_details: RegisterRequest[]
  }

  type SendRequestResponse = {
    request_id: string
    approval_type_id: string
    approval_routes: ApprovalRouteResponse[]
    request_emp_nm: string
    approval_type_nm: string
    created: string
    department_nm: string
  } & GetAprrovalTypeResponse

  type FormSummary = {
    emp_nm?: string
    approval_type_nm?: string
    created?: string
    department_nm?: string
    approval_type_id?: string
  }

  type RegisterApprovalRecord = {
    approval_emp_id: number
    record_nm: string
    order: number
    emp_nm: string
  }

  type NotificationRecords = {
    notify_emp_id: number
    notify_emp_nm: string
    notification_type_id: string
    notification_type_nm: string
  }
}
