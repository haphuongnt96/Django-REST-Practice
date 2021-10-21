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
  setDataSearch(value: { department: string }) {
    this.applicantContent = value.department
  }
}
</script>

<template>
  <div>
    <div class="text-h4 txt-text-1 mb-2">{{ contents.APP_INFORMATION }}</div>
    <div class="d-flex flex-gap-8">
      <div class="d-flex align-center">
        <span class="mr-2">{{ contents.APP_CONTENT }}:</span>
        <span class="text-body-2 txt-text-2">{{ contents.APP_TITLE }}</span>
      </div>
      <div>
        <span class="mr-2">{{ contents.DEPARTMENT_NAME }}:</span>
        <span class="text-body-2 txt-text-2">{{ contents.APP_TITLE }}</span>
        <!-- <span class="mr-8">{{ applicantContent }}</span>
        <ApprovalSearchPopup @setDataSearch="setDataSearch" /> -->
      </div>
      <div class="d-flex align-center">
        <span class="mr-2">{{ contents.APP_DATE }}:</span>
        <span class="text-body-2 txt-text-2">
          {{ format(Date.now(), 'dd/MM/yyyy hh:mm') }}
        </span>
      </div>
      <div class="d-flex align-center">
        <span class="mr-2">{{ contents.REQUEST_USER_NAME }}:</span>
        <span class="text-body-2 txt-text-2">{{ contents.APP_TITLE }}</span>
      </div>
    </div>
  </div>
</template>

<style lang="scss" scoped></style>
