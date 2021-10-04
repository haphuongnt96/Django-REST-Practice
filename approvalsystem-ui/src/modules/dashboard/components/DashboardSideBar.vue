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
              <span class="noti-number primary-text">10</span>
            </a>
          </li>
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.APPLICANT_REMAND }}
              <span class="noti-number">
                <span>1</span>
                <v-icon class="cta">mdi-bell</v-icon>
              </span>
            </a>
          </li>
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.APPLICANT_DRAFT }}
              <span class="noti-number">
                <span class="blue-noti">1</span>
                <v-icon class="cta">mdi-email</v-icon>
              </span>
              <!-- <span class="noti-number primary-text">3</span> -->
            </a>
          </li>
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.APPLICANT_APPROVAL_NOTI }}
              <span class="noti-number primary-text">3</span>
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
            </a>
          </li>
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.UN_APPROVED_WAITING }}
            </a>
          </li>
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.UN_APPROVED_UNFINISHED }}
            </a>
          </li>
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.UN_APPROVED_CANCELLATION }}
            </a>
          </li>
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.ABSENCE_NOTI }}
            </a>
          </li>
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.REMAND_NOTI }}
            </a>
          </li>
          <li class="nav__submenu--items">
            <a href="#">
              {{ contents.APPROVAL_NOTI }}
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
            </a>
          </li>
        </ul>
      </li>
    </ul>
  </div>
</template>

<style lang="scss" scoped></style>
