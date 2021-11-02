<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import { format } from 'date-fns'
import { Getter as G } from 'vuex-class'
import { AuthD } from '@/store/typeD'

@Component({
  components: {}
})
export default class ApprovalRequestHeader extends Vue {
  @G(...AuthD.getUser) user: Auth.User
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  format = format
  //#region COMPUTED
  get contents() {
    return this.$pageContents.APPROVAL
  }

  get approvalType() {
    return this.$route.query.approval_type_nm
  }

  get departmentName() {
    return this.$route.query.department_nm
  }
  //#endregion
}
</script>

<template>
  <div>
    <div class="text-h5 txt-text-1 mb-2">{{ contents.APP_INFORMATION }}</div>
    <div class="d-flex flex-gap-8">
      <div class="d-flex align-center">
        <span class="mr-2">{{ contents.APP_CONTENT }}:</span>
        <span class="text-body-1 txt-text-2">{{ approvalType }}</span>
      </div>
      <div>
        <span class="mr-2">{{ contents.DEPARTMENT_NAME }}:</span>
        <span class="text-body-1 txt-text-2">{{ departmentName }}</span>
      </div>
      <div class="d-flex align-center">
        <span class="mr-2">{{ contents.APP_DATE }}:</span>
        <span class="text-body-1 txt-text-2">
          {{ format(Date.now(), 'dd/MM/yyyy hh:mm') }}
        </span>
      </div>
      <div class="d-flex align-center">
        <span class="mr-2">{{ contents.REQUEST_USER_NAME }}:</span>
        <span class="text-body-1 txt-text-2">{{ user.emp_nm }}</span>
      </div>
    </div>
  </div>
</template>

<style lang="scss" scoped></style>
