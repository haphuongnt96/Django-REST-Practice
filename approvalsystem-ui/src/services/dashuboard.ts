import { transformData } from '@/common/helpers'
import service from './base'

export function getDashuboardSerchRecord() {
  return transformData(
    service.request<Dashboard.DashboardDetailSerchTable[]>({
      method: 'get',
      url: 'api/requests/get_list'
    })
  )
}
