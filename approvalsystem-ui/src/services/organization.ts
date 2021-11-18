import { transformData } from '@/common/helpers'
import service from './base'

export function getOrganizations() {
  return transformData(
    service.request<Organization.GetOrganationsResponse>({
      method: 'get',
      url: 'api/organizations'
    })
  )
}
