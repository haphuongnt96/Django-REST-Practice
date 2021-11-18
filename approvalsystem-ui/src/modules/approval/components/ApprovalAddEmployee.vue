<script lang="ts">
import { Component, Emit, Prop, Vue } from 'vue-property-decorator'
import PopSearchEmployee from '@/modules/employee/components/PopSearchEmployee.vue'
import CurrencyInput from '@/common/components/ui/CurrencyInput.vue'
import { ValidationObserver } from 'vee-validate'
// eslint-disable-next-line @typescript-eslint/no-var-requires
const orderBy = require('lodash.orderby')

@Component({
  components: { PopSearchEmployee, CurrencyInput }
})
export default class ApprovalAddEmployee extends Vue {
  @Prop() allowOrder: boolean
  @Prop({
    default: function () {
      return []
    }
  })
  approval_route_details: Approvals.ApprovalRouteDetailResponse[]

  //#region Data
  valid = false
  order = ''
  record_nm = ''
  employee = {} as Employee.EmployeeAffiliation
  isSubmited = false

  //#endregion

  //#region Emit
  @Emit('addRecord') addRecord() {
    return this.selectedEmployee
  }
  //#endregion

  //#region Computed
  get disabledIds() {
    return this.approval_route_details.map((x) => x.approval_emp_id)
  }

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

  get minOrder() {
    const defaultApprovals = orderBy(
      this.approval_route_details,
      'order',
      'desc'
    ) as Approvals.ApprovalRouteDetailResponse[]
    const defaultApproval = defaultApprovals.find((x) => x.default_flg)
    return defaultApproval ? defaultApproval.order + 1 : 0
  }

  get observer() {
    return this.$refs.observer as InstanceType<typeof ValidationObserver>
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
    this.observer.reset()
    this.isSubmited = false
  }

  async handleAddRecord() {
    this.isSubmited = true
    const valid = await this.observer.validate()
    if (!valid) return
    this.addRecord()
    this.reset()
  }
  //#endregion
}
</script>

<template>
  <ValidationObserver ref="observer">
    <div class="d-flex flex-gap-8 mb-3">
      <div class="d-flex flex-gap-2 wrap">
        <div class="mt-2">{{ contents.ADD_APPROVERS }}</div>
        <div>
          <div class="d-flex pa-2 text-body-1 txt-white employee__summary">
            <span>{{ employee.emp_id }}</span>
            <v-divider vertical class="mx-2" />
            <span>{{ employee.emp_nm }}</span>
          </div>
          <div
            v-if="isSubmited && !employee.emp_id"
            class="v-messages error--text"
          >
            Required
          </div>
        </div>
      </div>
      <PopSearchEmployee :disabledIds="disabledIds" @setData="setEmployee" />
      <div class="d-flex flex-gap-2">
        <div class="mt-2">{{ contents.POSITION_NAME }}</div>
        <TextField v-model="record_nm" :validations="'required'" />
      </div>
      <div class="d-flex flex-gap-2" v-if="allowOrder">
        <div class="mt-2">
          {{ contents.INSERT_ORDER }}
        </div>
        <CurrencyInput
          v-model="order"
          :rules="`required|min_value:${minOrder}`"
        />
      </div>
      <v-spacer />
      <v-btn color="secondary" @click="handleAddRecord">
        {{ contents.ADD }}
      </v-btn>
    </div>
  </ValidationObserver>
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

::v-deep {
  .employee__summary {
    .theme--light.v-input--is-disabled input {
      color: white !important;
    }
  }
  .v-text-field__details {
    margin-bottom: 0 !important;
  }
}

hr {
  background: white;
}

.wrap {
  flex-wrap: wrap;
}
</style>
