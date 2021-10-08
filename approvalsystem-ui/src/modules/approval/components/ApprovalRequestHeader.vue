<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import ApprovalSearchPopup from '@/modules/approval/components/ApprovalSearchPopup.vue'
import { format } from 'date-fns'

@Component({
  components: {
    ApprovalSearchPopup
  }
})
export default class RequestHeader extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  format = format
  //#region COMPUTED
  applicantContent = '申請書名'
  get contents() {
    return this.$pageContents.APPROVAL
  }
  //#endregion
  setDataSearch(value) {
    this.applicantContent = value.department
  }
}
</script>

<template>
  <v-card flat>
    <v-card-title>{{ contents.APP_INFORMATION }}</v-card-title>
    <v-card-text class="text-body-2 fw-600">
      <div class="d-flex flex-gap-8">
        <div>{{ contents.APP_CONTENT }}:</div>
        <div>
          <span class="mr-8">{{ applicantContent }}</span>
          <ApprovalSearchPopup @setDataSearch="setDataSearch" />
        </div>
      </div>
      <div class="d-flex flex-gap-8">
        <div>{{ contents.APP_DEPARTMENT }}:</div>
        <div>
          <div>{{ contents.DEPARTMENT_NAME }}</div>
        </div>
      </div>
      <div class="d-flex flex-gap-8">
        <div>{{ contents.APP_CONTENT }}:</div>
        <div>
          <div>{{ format(Date.now(), 'dd/mm/yyyy hh:mm') }}</div>
        </div>
      </div>
      <div class="d-flex flex-gap-8">
        <div>{{ contents.APP_NAME }}:</div>
        <div></div>
      </div>
    </v-card-text>
  </v-card>
</template>

<style lang="scss" scoped></style>
