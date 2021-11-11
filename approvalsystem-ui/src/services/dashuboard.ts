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
// 申請者の状況数を取得する
export function getDashuboardSideRequestNotification() {
  return transformData(
    service.request<Dashboard.DashboardSideRequestNotifications[]>({
      method: 'get',
      url: 'api/request_notifications/get_count'
    })
  )
}

/**
 * 申請者通知リストを取得する。
 *
 * @param empId ログイン者の社員ID
 * @returns 申請者の通知リスト
 */
export function getApplicantNotifications(empId: number) {
  return transformData(
    service.request<Approvals.NotificationRecord[]>({
      method: 'get',
      url: `api/notification/applicant/${empId}`
    })
  )
}
