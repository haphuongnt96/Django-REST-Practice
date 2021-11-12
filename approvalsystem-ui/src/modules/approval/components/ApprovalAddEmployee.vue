<script lang="ts">
import { Component, Emit, Prop, Vue } from 'vue-property-decorator'
import PopSearchEmployee from '@/modules/employee/components/PopSearchEmployee.vue'
import CurrencyInput from '@/common/components/ui/CurrencyInput.vue'

@Component({
  components: { PopSearchEmployee, CurrencyInput }
})
export default class ApprovalAddEmployee extends Vue {
  @Prop() allowOrder: boolean

  //#region Data
  order = ''
  record_nm = ''
  employee = {} as Employee.EmployeeAffiliation

  //#endregion

  //#region Emit
  @Emit('addRecord') addRecord() {
    return this.selectedEmployee
  }
  //#endregion

  //#region Computed

  get contents() {
    return { ...this.$pageContents.APPROVAL_TABS, ...this.$pageContents.COMMON }
  }

  get selectedEmployee() {
    return {
      approval_emp_id: this.employee.emp_id,
      order: +this.order,
      record_nm: this.record_nm,
      emp_nm: this.employee.emp_nm
    }
  }
  //#endregion

  //#region Methods
  setEmployee(item: Employee.EmployeeAffiliation) {
    this.employee = item
  }

  reset() {
    this.employee = {} as Employee.EmployeeAffiliation
    this.order = ''
    this.record_nm = ''
  }

  handleAddRecord() {
    this.addRecord()
    this.reset()
  }
  //#endregion
}
</script>

<template>
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
      <v-text-field outlined dense hide-details="auto" v-model="record_nm" />
    </div>
    <div class="d-flex align-center flex-gap-2" v-if="allowOrder">
      {{ contents.INSERT_ORDER }}
      <CurrencyInput v-model="order" />
    </div>
    <v-spacer />
    <v-btn color="secondary" @click="handleAddRecord">{{ contents.ADD }}</v-btn>
  </div>
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
