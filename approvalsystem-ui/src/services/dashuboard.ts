import { transformData } from '@/common/helpers'
import service from './base'

//　ダッシュボードの申請レコード取得
export function getDashuboardSerchRecord() {
  return transformData(
    service.request<Dashboard.DashboardDetailSerchTable[]>({
      method: 'get',
      url: 'api/requests/get_list'
    })
  )
}
//　お知らせの取得
export function getDashuboardNotification() {
  return transformData(
    service.request<Dashboard.DashboardNotification[]>({
      method: 'get',
      url: 'api/notification/get_list'
    })
  )
}
