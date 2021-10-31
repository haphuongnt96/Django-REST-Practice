import { transformData } from '@/common/helpers'
import service from './base'

export function getApprovals(id: string) {
  return transformData(
    service.request<Approvals.ApprovalRouteResponse[]>({
      method: 'get',
      url: `api/requests/${id}/approval_routes`
    })
  )
}

export function getApprovalRouteDetail(id: string) {
  return transformData(
    service.request<Approvals.ApprovalRouteDetailResponse[]>({
      method: 'get',
      url: `api/approval_routes/${id}/approval_route_details`
    })
  )
}
export function postApprovalStatus(
  id: string,
  data: { approval_status: string }
) {
  return transformData(
    service.request<Approvals.ApprovalRouteDetailResponse[]>({
      method: 'post',
      url: `api/requests/${id}/approval`,
      data
    })
  )
}

export function getApprovalRouteComment(id: string) {
  return transformData(
    service.request<Approvals.ApprovalRouteCommentResponse[]>({
      method: 'get',
      url: `api/approval_routes/${id}/approval_route_comment`
    })
  )
}

export function getApproveTypes() {
  return transformData(
    service.request<Approvals.GetAprrovalTypesResponse>({
      method: 'get',
      url: `api/approval_types`
    })
  )
}

export function getApproveTypeById(id: string) {
  return transformData(
    service.request<Approvals.GetAprrovalTypeResponse>({
      method: 'get',
      url: `api/approval_types/${id}`
    })
  )
}
