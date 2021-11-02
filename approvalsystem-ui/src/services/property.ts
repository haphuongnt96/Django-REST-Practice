import { transformData } from '@/common/helpers'
import service from './base'

export function getPropertySearchRecord() {
  return transformData(
    service.request<Dashboard.DashboardPropertySearchTable[]>({
      method: 'get',
      url: 'api/property/get_list'
    })
  )
}
