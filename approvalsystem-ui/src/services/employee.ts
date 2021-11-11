import CONSTANTS from '@/common/constant'
import { transformData } from '@/common/helpers'
import service from './base'

export function searchEmployeeAffiliations(
  params: Employee.SearchEmployees = {
    limit: CONSTANTS.VTABLE_DATA_CONFIG.ITEMS_PER_PAGE,
    offset: CONSTANTS.VTABLE_DATA_CONFIG.OFFSET
  }
) {
  return transformData(
    service.request<Employee.SearchUsers>({
      method: 'get',
      url: 'api/emp_affiliations',
      params
    })
  )
}
