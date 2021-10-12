import { transformData } from '@/common/helpers'
import service from './base'

export function doLogin(data: any) {
  return transformData(
    service.request<Auth.User[]>({
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
export function getUserInfo() {
  return transformData(
    service.request<Auth.User[]>({
      method: 'get',
      url: `api/user/info/`
    })
  )
}
