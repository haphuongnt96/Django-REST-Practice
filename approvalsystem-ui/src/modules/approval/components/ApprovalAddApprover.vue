<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import PopSearchEmployee from '@/modules/employee/components/PopSearchEmployee.vue'
import CurrencyInput from '@/common/components/ui/CurrencyInput.vue'

@Component({
  components: { PopSearchEmployee, CurrencyInput }
})
export default class ApprovalAddApprover extends Vue {
  //#region Data
  approvers: Approvals.RegisterApprovalRouteDetail[] = []
  order = ''
  approval_post_nm = ''
  employee = {} as Employee.EmployeeAffiliation
  drag = false
  dragOptions = {
    animation: 200,
    group: 'description',
    disabled: false,
    ghostClass: 'ghost'
  }

  //#endregion

  //#region Methods
  setEmployee(item: Employee.EmployeeAffiliation) {
    this.employee = item
  }

  addApprover() {
    this.approvers.push(this.selectedEmployee)
    this.resetSelectedEmployee()
  }

  resetSelectedEmployee() {
    this.employee = {} as Employee.EmployeeAffiliation
    this.order = ''
    this.approval_post_nm = ''
  }

  removeEmployee(employee: Employee.EmployeeAffiliation) {
    const index = this.approvers.findIndex(
      (x) => x.approval_emp_id === employee.emp_id
    )
    this.approvers.splice(index, 1)
  }
  //#endregion

  //#region Computed
  get headers() {
    return [
      { text: this.contents.POSITION, value: 'approval_post_nm' },
      { text: this.contents.NAME, value: 'emp_nm' },
      { text: '', value: 'action', width: '200' }
      // { text: this.contents.CONFIRMED_DATE, value: 'date' }
    ]
  }

  get contents() {
    return { ...this.$pageContents.APPROVAL_TABS, ...this.$pageContents.COMMON }
  }

  get selectedEmployee() {
    return {
      approval_emp_id: this.employee.emp_id,
      order: +this.order,
      approval_post_nm: this.approval_post_nm,
      emp_nm: this.employee.emp_nm
    }
  }
  //#endregion
}
</script>

<template>
  <v-container fluid px-0>
    <div class="text-h5 txt-text-1 mb-2">{{ contents.LIST_OF_APPROVER }}</div>
    <div class="d-flex align-center flex-gap-8 mb-3">
      <div class="d-flex align-center flex-gap-2">
        <div>{{ contents.ADD_APPROVERS }}</div>
        <div class="d-flex pa-2 text-body-1 txt-white employee__summary">
          <span>{{ employee.emp_id }}</span>
          <v-divider vertical class="mx-2" />
          <span>{{ employee.emp_nm }}</span>
        </div>
      </div>
      <PopSearchEmployee @setData="setEmployee" />
      <div class="d-flex align-center flex-gap-2">
        {{ contents.POSITION_NAME }}
        <v-text-field
          outlined
          dense
          hide-details="auto"
          v-model="approval_post_nm"
        />
      </div>
      <div class="d-flex align-center flex-gap-2">
        {{ contents.INSERT_ORDER }}
        <CurrencyInput v-model="order" />
      </div>
      <v-spacer />
      <v-btn color="secondary" @click="addApprover">{{ contents.ADD }}</v-btn>
    </div>
    <v-data-table
      :headers="headers"
      :items="approvers"
      :no-data-text="contents.TABLE_NO_DATA"
    >
      <template v-slot:body="props">
        <draggable
          :list="props.items"
          tag="tbody"
          :component-data="{
            tag: 'tr',
            type: 'transition-group',
            name: !drag ? 'flip-list' : null
          }"
          @start="drag = true"
          @end="drag = false"
          v-bind="dragOptions"
        >
          <tr v-for="(item, index) in props.items" :key="index">
            <td>{{ item.approval_post_nm }}</td>
            <td>{{ item.emp_nm }}</td>
            <td class="text-center">
              <v-icon
                small
                :color="$config.Colors.red2"
                @click="removeEmployee(item)"
              >
                mdi-close
              </v-icon>
            </td>
          </tr>
        </draggable>
      </template>
    </v-data-table>
  </v-container>
</template>

<style lang="scss" scoped>
.employee__summary {
  background: $blue-2;
  min-width: 200px;
  min-height: 37px;
  border-radius: 4px;
  > span {
    &:first-child {
      min-width: 32px;
    }
  }
}

hr {
  background: white;
}
</style>
