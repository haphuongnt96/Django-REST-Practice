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
