<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
@Component({ components: {} })
export default class SideBar extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  //#region COMPUTED
  get contents() {
    return this.$pageContents.DASHBOARD
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
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.APPLICANT_CREATE_NEW }}
            </a>
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
        <a href="#">{{ contents.APPROVER }}</a>
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
