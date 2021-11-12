<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import CreateApplicationPopup from '@/modules/approval/components/CreateApplicationPopup.vue'
import { Routes } from '@/router'
import { Getter as G } from 'vuex-class'
import { AuthD } from '@/store/typeD'

@Component({ components: { CreateApplicationPopup } })
export default class DashboardSideBar extends Vue {
  @G(...AuthD.getUser) user: Auth.User
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  isOpen = false

  // 申請者承認通知件数
  applicantApprovalCnt = 0
  // 申請者通知リスト
  applicantNotifications: Approvals.NotificationRecord[] = []

  //#region COMPUTED
  get contents() {
    this.getApplicantNotifications()
    return this.$pageContents.DASHBOARD
  }
  //#endregion

  //#region Methods
  setDataSearch(approvalType: Approvals.ApprovalType) {
    const { approval_type_id, department_id } = approvalType
    this.$router.push({
      name: Routes.approval.name,
      query: { approval_type_id, department_id }
    })
  }

  /**
   * 申請者承認通知件数取得
   */
  async getApplicantNotifications() {
    const [err, res] = await this.$api.dashboard.getApplicantNotifications(
      this.user.id
    )
    if (!err && res) {
      this.applicantNotifications = res
      this.applicantApprovalCnt = this.applicantNotifications.length
    }
  }
  //#endregion
}
</script>

<template>
  <div class="side__bar">
    <ul class="nav__menu">
      <li class="nav__menu--items">
        <a href="#">{{ contents.APPLICANT }}</a>
        <ul class="nav__submenu">
          <!-- 新規作成 -->
          <li class="nav__submenu--items mb-2">
            <v-btn
              width="100%"
              color="secondary"
              class="mr-3"
              @click="isOpen = true"
            >
              {{ contents.APPLICANT_CREATE_NEW }}
            </v-btn>
            <CreateApplicationPopup
              v-model="isOpen"
              v-if="isOpen"
              @setDataSearch="setDataSearch"
            />
          </li>
          <!-- 申請中 -->
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.APPLICANT_APPLYING }}

              <span class="noti-number">
                <span class="blue-noti">1</span>
                <v-icon class="cta ring-anmation">mdi-email</v-icon>
              </span>
            </a>
          </li>
          <!-- 差戻 -->
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.APPLICANT_REMAND }}
              <span class="noti-number">
                <v-icon class="cta">mdi-alert-decagram</v-icon>
              </span>
            </a>
          </li>
          <!-- 下書き -->
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.APPLICANT_DRAFT }}
              <span class="noti-number">
                <v-icon class="cta">mdi-account-edit</v-icon>
              </span>

              <!-- <span class="noti-number primary-text">3</span> -->
            </a>
          </li>
          <!-- 承認通知 -->
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.APPLICANT_APPROVAL_NOTI }}
              <span class="noti-number">
                <span class="red-noti" v-if="this.applicantApprovalCnt > 0">
                  {{ this.applicantApprovalCnt }}
                </span>
                <v-icon class="cta">mdi-hand-okay</v-icon>
              </span>
            </a>
          </li>
        </ul>
      </li>
      <li class="nav__menu--items">
        <a href="#">{{ contents.APPROVER }}</a>
        <ul class="nav__submenu">
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.UN_APPROVED }}
              <span class="noti-number">
                <span class="blue-noti">1</span>
                <v-icon class="cta ring-anmation">mdi-email</v-icon>
              </span>
            </a>
          </li>
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.UN_APPROVED_WAITING }}
              <span class="noti-number">
                <v-icon class="cta">mdi-account-clock</v-icon>
              </span>
            </a>
          </li>
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.UN_APPROVED_UNFINISHED }}
              <span class="noti-number">
                <v-icon class="cta">mdi-account-reactivate</v-icon>
              </span>
            </a>
          </li>
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.UN_APPROVED_CANCELLATION }}
              <span class="noti-number">
                <span>1</span>
                <v-icon class="cta ring-anmation">mdi-bell</v-icon>
              </span>
            </a>
          </li>
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.ABSENCE_NOTI }}
              <span class="noti-number">
                <v-icon class="cta">mdi-bike-fast</v-icon>
              </span>
            </a>
          </li>
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.REMAND_NOTI }}
              <span class="noti-number">
                <v-icon class="cta">mdi-account-alert</v-icon>
              </span>
            </a>
          </li>
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.APPROVAL_NOTI }}
              <span class="noti-number">
                <v-icon class="cta">mdi-hand-okay</v-icon>
              </span>
            </a>
          </li>
        </ul>
      </li>
      <li class="nav__menu--items">
        <a href="#">{{ contents.NOTIFIER }}</a>
        <ul class="nav__submenu">
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.APPROVAL_NOTI }}
              <span class="noti-number">
                <v-icon class="cta">mdi-hand-okay</v-icon>
              </span>
            </a>
          </li>
        </ul>
      </li>
    </ul>
  </div>
</template>

<style lang="scss" scoped></style>
