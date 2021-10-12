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

export function doChangePass(data: any) {
  return transformData(
    service.request<Auth.User[]>({
      method: 'post',
      url: '/api/user/changepass/'
    })
  )
}
