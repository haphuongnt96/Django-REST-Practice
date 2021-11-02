<script lang="ts">
import AppDialog from '@/common/components/ui/AppDialog.vue'
import DashboardDetailSearchTable from '@/modules/dashboard/components/DashboardDetailSearchTable.vue'
import { AuthD } from '@/store/typeD'
import { Component, Mixins } from 'vue-property-decorator'
import { Getter as G } from 'vuex-class'
// eslint-disable-next-line @typescript-eslint/no-var-requires
const debounce = require('lodash.debounce')

@Component({
  components: {
    DashboardDetailSearchTable
  }
})
export default class CreateApplicationPopup extends Mixins(AppDialog) {
  @G(...AuthD.getUser) user: Auth.User
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  searchAppNameDebounce = debounce(this.onAppNameChanged, 500)
  approval_classes: Approvals.ApprovalClass[] = []
  approval_types: Approvals.ApprovalType[] = []
  divisions: Approvals.ApprovalDivision[] = []
  segments: Approvals.ApprovalSegment[] = []
  userDepartment = {} as Auth.Affiliation
  selectedClassId = ''
  selectedSegmentId = ''
  selectedDivisionId = ''
  appName = ''
  name = ''
  valid = false
  rules = [(v: Auth.Affiliation) => !!v || 'Required']
  headers = [
    {
      text: 'ID',
      value: 'approval_type_id'
    },
    {
      text: '主幹部署',
      value: 'segment_nm'
    },
    {
      text: '分類',
      value: 'division_nm'
    },
    {
      text: '申請内容',
      value: 'approval_type_nm'
    }
  ]

  //#region COMPUTED
  get userAffiliations() {
    return this.user.affiliations
  }

  get contents() {
    return {
      ...this.$pageContents.DASHBOARD,
      ...this.$pageContents.APPLICATION_SEARCH_POPUP
    }
  }

  get items() {
    return this.approval_types.filter((x) => this.conditions(x))
  }

  get conditions() {
    return (item: Approvals.ApprovalType) => {
      const segment_id = this.selectedSegmentId
        ? item.segment_id === this.selectedSegmentId
        : true
      const division_id = this.selectedDivisionId
        ? item.division_id === this.selectedDivisionId
        : true
      const approval_class_id = this.selectedClassId
        ? item.segment_id === this.selectedClassId
        : true
      const approval_type_nm = this.appName
        ? item.approval_type_nm.includes(this.appName)
        : true
      return segment_id && division_id && approval_class_id && approval_type_nm
    }
  }
  //#endregion

  //#region Hook
  async mounted() {
    const [err, res] = await this.$api.approval.getApproveTypes()
    if (!err && res) {
      const { approval_classes, approval_types, divisions, segments } = res
      this.approval_classes = approval_classes
      this.approval_types = approval_types
      this.divisions = divisions
      this.segments = segments
    }
  }
  //#endregion

  //#region Methods
  selectForm(approvalType: Approvals.ApprovalType) {
    if (!this.valid) return
    this.$emit('setDataSearch', { ...this.userDepartment, ...approvalType })
    this.isOpen = false
  }

  onAppNameChanged(value: string) {
    this.appName = value
  }
  //#endregion
}
</script>

<template>
  <v-dialog v-model="isOpen" width="80%">
    <v-form v-model="valid">
      <v-card class="pa-5">
        <div
          :style="{ width: 'fit-content' }"
          class="d-flex align-center flex-gap-2 mb-5"
        >
          {{ contents.APP_DEPARTMENT }}
          <v-select
            v-model="userDepartment"
            return-object
            :items="userAffiliations"
            item-text="department_nm"
            item-value="department_id"
            :label="contents.USER_DEPARTMENTS_BELONGED"
            dense
            outlined
            hide-details="auto"
            :rules="rules"
          />
        </div>
        <div class="text-h5 mb-5">
          {{ contents.POPUP_SEARCH_TITLE }}
        </div>
        <div class="filters d-flex align-center flex-gap-8 mb-3">
          <div class="d-flex align-center flex-gap-2">
            {{ contents.POPUP_SEARCH_DEPARTMENT }}
            <v-select
              v-model="selectedSegmentId"
              :items="segments"
              clearable
              item-text="segment_nm"
              item-value="segment_id"
              :label="contents.POPUP_SEARCH_DEPARTMENT_PLACEHOLDER"
              dense
              outlined
              hide-details="auto"
            />
            <v-select
              v-model="selectedDivisionId"
              :items="divisions"
              clearable
              item-text="division_nm"
              item-value="division_id"
              :label="contents.POPUP_SEARCH_CATEGORY_PLACEHOLDER"
              dense
              outlined
              hide-details="auto"
            />
          </div>
          <div class="d-flex align-center flex-gap-2">
            {{ contents.POPUP_SEARCH_CATEGORY }}
            <v-select
              v-model="selectedClassId"
              :items="approval_classes"
              clearable
              item-text="approval_class_id"
              item-value="approval_class_nm"
              :label="contents.POPUP_SEARCH_CONTENT_PLACEHOLDER"
              dense
              outlined
              hide-details="auto"
            />
          </div>
          <div class="d-flex align-center flex-gap-2">
            {{ contents.POPUP_SEARCH_CONTENT }}
            <v-text-field
              dense
              outlined
              hide-details="auto"
              @input="searchAppNameDebounce"
            ></v-text-field>
          </div>
          <v-spacer />
          <v-btn color="secondary">{{ contents.FORM_SEARCH }}</v-btn>
        </div>
        <v-data-table
          :headers="headers"
          :items="items"
          :no-data-text="contents.TABLE_NO_DATA"
          @click:row="selectForm"
        >
          <template v-slot:item.date="{ item }">
            {{ item.date | date }}
          </template>
        </v-data-table>
      </v-card>
    </v-form>
  </v-dialog>
</template>

<style lang="scss" scoped>
.filters {
  white-space: nowrap;
}
</style>
