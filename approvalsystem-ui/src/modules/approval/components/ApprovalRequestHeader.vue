<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator'
import { format } from 'date-fns'

@Component({
  components: {}
})
export default class ApprovalRequestHeader extends Vue {
  @Prop({
    default: function () {
      return {}
    }
  })
  formSummary: Approvals.FormSummary
  @Prop() request_title: string
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  format = format
  //#region COMPUTED
  get title() {
    return this.request_title
  }

  set title(value: string) {
    this.$emit('update:request_title', value)
  }

  get contents() {
    return this.$pageContents.APPROVAL
  }

  get createdAt() {
    return this.formSummary.created
  }

  get approvalType() {
    return this.formSummary.approval_type_nm
  }

  get departmentName() {
    return this.formSummary.department_nm
  }

  get userName() {
    return this.formSummary.emp_nm
  }

  get requestTitle() {
    return this.formSummary.request_title
  }

  set requestTitle(value: string) {
    const result = { ...this.formSummary, ...{ request_title: value } }
    this.$emit('update:formSummary', result)
  }
  //#endregion
}
</script>

<template>
  <div>
    <div class="text-h5 txt-text-1 mb-2">{{ contents.APP_INFORMATION }}</div>
    <div class="d-flex flex-gap-2 mb-4">
      <div class="mt-2">申請タイトル</div>
      <TextField v-model="requestTitle" :validations="'required'" />
    </div>
    <div class="d-flex flex-gap-8">
      <div class="d-flex align-center">
        <span class="mr-2">{{ contents.APP_CONTENT }}:</span>
        <span class="text-body-1 txt-text-2">{{ approvalType }}</span>
      </div>
      <div>
        <span class="mr-2">{{ contents.DEPARTMENT_NAME }}:</span>
        <span class="text-body-1 txt-text-2">{{ departmentName }}</span>
      </div>
      <div class="d-flex align-center" v-if="createdAt">
        <span class="mr-2">{{ contents.APP_DATE }}:</span>
        <span class="text-body-1 txt-text-2">
          {{ createdAt | date('dd/MM/yyyy hh:mm') }}
        </span>
      </div>
      <div class="d-flex align-center">
        <span class="mr-2">{{ contents.REQUEST_USER_NAME }}:</span>
        <span class="text-body-1 txt-text-2">{{ userName }}</span>
      </div>
    </div>
  </div>
</template>

<style lang="scss" scoped>
::v-deep {
  .v-text-field__details {
    margin-bottom: 0 !important;
  }
}
</style>
