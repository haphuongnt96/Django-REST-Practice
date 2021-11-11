import { transformData } from '@/common/helpers'
import service from './base'

export function getApplicationFormSearchRecord() {
  return transformData(
    service.request<Dashboard.DashboardApplicationFormSearchTable[]>({
      method: 'get',
      url: 'api/application_form/get_list'
    })
  )
}
