<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator'
import ApprovalAddEmployee from '@/modules/approval/components/ApprovalAddEmployee.vue'
import { Mutation as M } from 'vuex-class'
import { ApprovalRequestD } from '@/store/typeD'

@Component({
  components: { ApprovalAddEmployee }
})
export default class ApprovalAddApprover extends Vue {
  @M(...ApprovalRequestD.setListApprovers) setListApprovers: (
    approvers: Approvals.ApprovalRouteDetailResponse[]
  ) => void

  @Prop({
    default: function () {
      return []
    }
  })
  approval_route_details: Approvals.ApprovalRouteDetailResponse[]

  //#region Data
  drag = false
  dragOptions = {
    animation: 200,
    group: 'description',
    disabled: false,
    ghostClass: 'ghost'
  }

  //#endregion

  //#region Computed
  get approvers() {
    return this.approval_route_details
  }

  set approvers(value: Approvals.ApprovalRouteDetailResponse[]) {
    value.forEach((x, i) => {
      x.order = i + 1
    })
    this.setListApprovers(value)
  }

  get headers() {
    return [
      {
        text: 'No',
        value: 'index'
      },
      { text: this.contents.POSITION, value: 'approval_post_nm' },
      { text: this.contents.NAME, value: 'emp_nm' },
      { text: '', value: 'action', width: '200' }
      // { text: this.contents.CONFIRMED_DATE, value: 'date' }
    ]
  }

  get contents() {
    return { ...this.$pageContents.APPROVAL_TABS, ...this.$pageContents.COMMON }
  }

  get disabledRow() {
    return (item: Approvals.ApprovalRouteDetailResponse) => {
      return item.default_flg
    }
  }
  //#endregion

  //#region Methods

  addApprover(record: Approvals.RegisterApprovalRecord) {
    const insertBeforeIndex = this.approvers.findIndex(
      (x) => x.order > record.order
    )
    const index =
      insertBeforeIndex > -1 ? insertBeforeIndex - 1 : this.approvers.length
    const newRecord = {
      approval_route_id: '',
      approval_post_nm: record.record_nm,
      order: record.order,
      notification: '',
      approval_post_cd: '',
      approval_emp_id: record.approval_emp_id,
      approval_emp_nm: record.emp_nm,
      approval_status: false,
      approval_date: ''
    }
    this.approvers.splice(index, 0, newRecord)
  }

  removeEmployee(employee: Employee.EmployeeAffiliation) {
    const index = this.approvers.findIndex(
      (x) => x.approval_emp_id === employee.emp_id
    )
    this.approvers.splice(index, 1)
  }
  //#endregion
}
</script>

<template>
  <v-container fluid px-0>
    <div class="text-h5 txt-text-1 mb-2">{{ contents.LIST_OF_APPROVER }}</div>
    <ApprovalAddEmployee
      :approval_route_details="approval_route_details"
      @addRecord="addApprover"
      :allowOrder="true"
    />
    <v-data-table
      :headers="headers"
      :items="approvers"
      :items-per-page="$constants.VTABLE_DATA_CONFIG.ITEMS_PER_PAGE"
      :no-data-text="$constants.VTABLE_DATA_CONFIG.TEXT_NO_DATA"
      disable-sort
    >
      <template v-slot:body="props">
        <draggable
          v-model="approvers"
          tag="tbody"
          :component-data="{
            tag: 'tr',
            type: 'transition-group',
            name: !drag ? 'flip-list' : null
          }"
          draggable=".draggable"
          @start="drag = true"
          @end="drag = false"
          v-bind="dragOptions"
          item-key="order"
        >
          <tr class="v-data-table__empty-wrapper" v-if="!approvers.length">
            <td class="text-center" colspan="4">
              {{ $constants.VTABLE_DATA_CONFIG.TEXT_NO_DATA }}
            </td>
          </tr>
          <tr
            :class="[disabledRow(item) ? 'disabled' : 'draggable']"
            v-for="(item, index) in props.items"
            :key="index"
          >
            <td>{{ index + 1 }}</td>
            <td>{{ item.approval_post_nm }}</td>
            <td>{{ item.approval_emp_nm }}</td>
            <td class="text-center">
              <v-icon
                v-if="!item.default_flg"
                small
                :color="$config.Colors.red2"
                @click="removeEmployee(item)"
              >
                mdi-trash-can-outline
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

tr {
  &.disabled {
    background: $blue-2;
    color: white;
    pointer-events: none;
  }
}
</style>
