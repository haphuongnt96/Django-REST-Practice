import { transformData } from '@/common/helpers'
import service from './base'

// 承認ルートIDから承認ルートの詳細情報を取得
export function getApprovalRouteDetail(id: string) {
  return transformData(
    service.request<Approvals.ApprovalRouteDetailResponse[]>({
      method: 'get',
      url: `api/approval_routes/${id}/approval_route_details`
    })
  )
}

// 承認テーブルの更新
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

export function sendRequest(data: Approvals.SendRequestParams) {
  return transformData(
    service.request<Approvals.SendRequestResponse>({
      method: 'post',
      url: `api/requests`,
      data
    })
  )
}

export function getRequestFormData(id: string) {
  return transformData(
    service.request<Approvals.SendRequestResponse>({
      method: 'get',
      url: `api/requests/${id}`
    })
  )
}

export function updateRequestFormData(
  id: string,
  data: Approvals.SendRequestParams
) {
  return transformData(
    service.request<Approvals.SendRequestResponse>({
      method: 'put',
      url: `api/requests/${id}`,
      data
    })
  )
}
