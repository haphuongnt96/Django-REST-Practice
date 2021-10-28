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
