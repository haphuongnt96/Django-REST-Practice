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
export function getDashuboardNews() {
  return transformData(
    service.request<Dashboard.DashboardNews[]>({
      method: 'get',
      url: 'api/news/get_list'
    })
  )
}
