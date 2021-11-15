import { transformData } from '@/common/helpers'
import service from './base'

export function getApprovalTypeSearchRecord() {
  return transformData(
    service.request<Dashboard.DashboardApprovalTypeSearchTable[]>({
      method: 'get',
      url: 'api/approval_types_select/get_list'
    })
  )
}
