<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import ApprovalSearchPopup from '@/modules/approval/components/ApprovalSearchPopup.vue'
import { Routes } from '@/router'

@Component({ components: { ApprovalSearchPopup } })
export default class DashboardSideBar extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  departmentName = ''
  isOpen = false

  //#region COMPUTED
  get contents() {
    return this.$pageContents.DASHBOARD
  }
  //#endregion

  //#region Methods
  setDataSearch(value: { department: string }) {
    this.departmentName = value.department
    this.$router.push({
      name: Routes.approval.name,
      query: { departmentName: this.departmentName }
    })
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
          <li class="nav__submenu--items mb-2">
            <v-btn
              width="100%"
              color="secondary"
              class="mr-3"
              @click="isOpen = true"
            >
              {{ contents.APPLICANT_CREATE_NEW }}
            </v-btn>
            <ApprovalSearchPopup
              v-model="isOpen"
              v-if="isOpen"
              @setDataSearch="setDataSearch"
            />
          </li>
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.APPLICANT_APPLYING }}

              <span class="noti-number">
                <span class="blue-noti">1</span>
                <v-icon class="cta ring-anmation">mdi-email</v-icon>
              </span>
            </a>
          </li>
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.APPLICANT_REMAND }}
              <span class="noti-number">
                <v-icon class="cta">mdi-alert-decagram</v-icon>
              </span>
            </a>
          </li>
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.APPLICANT_DRAFT }}
              <span class="noti-number">
                <v-icon class="cta">mdi-account-edit</v-icon>
              </span>

              <!-- <span class="noti-number primary-text">3</span> -->
            </a>
          </li>
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.APPLICANT_APPROVAL_NOTI }}
              <span class="noti-number">
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
