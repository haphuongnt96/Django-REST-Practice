import { transformData } from '@/common/helpers'
import service from './base'
import { GetUserListRequestParams } from './interfaces/aip_interfaces'

export function doLogin(data: { emp_cd: string; password: string }) {
  return transformData(
    service.request<Auth.User>({
      method: 'post',
      url: '/api/auth/login/',
      data
    })
  )
}

export function doLogout() {
  return transformData(
    service.request<Auth.User[]>({
      method: 'post',
      url: '/api/auth/logout/'
    })
  )
}

export function doChangePass(data: any) {
  return transformData(
    service.request<Auth.User[]>({
      method: 'put',
      url: '/api/user/changepass/',
      data
    })
  )
}

export function getUserInfo() {
  return transformData(
    service.request<Auth.User[]>({
      method: 'get',
      url: `api/user/info/`
    })
  )
}

export function getUserList(params: GetUserListRequestParams) {
  return transformData(
    service.request<Employee.Employee[]>({
      method: 'get',
      url: `api/user/get_list/`,
      params
    })
  )
}
