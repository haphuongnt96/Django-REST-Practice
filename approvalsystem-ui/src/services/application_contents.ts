import { transformData } from '@/common/helpers'
import service from './base'

export function getApplicationContentsSearchRecord() {
  return transformData(
    service.request<Dashboard.DashboardApplicationContentsSearchTable[]>({
      method: 'get',
      url: 'api/application_contents/get_list'
    })
  )
}
