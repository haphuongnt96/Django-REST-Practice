<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import ApprovalAddEmployee from '@/modules/approval/components/ApprovalAddEmployee.vue'
import { Mutation as M } from 'vuex-class'
import { ApprovalRequestD } from '@/store/typeD'

@Component({
  components: { ApprovalAddEmployee }
})
export default class ApprovalAddApprover extends Vue {
  @M(...ApprovalRequestD.setListApprovers) setListApprovers: (
    approvers: Approvals.RegisterApprovalRouteDetail[]
  ) => void

  //#region Data
  approvers: Approvals.RegisterApprovalRouteDetail[] = []
  drag = false
  dragOptions = {
    animation: 200,
    group: 'description',
    disabled: false,
    ghostClass: 'ghost'
  }

  //#endregion

  //#region Computed
  get headers() {
    return [
      {
        text: 'No',
        align: 'center',
        sortable: false,
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
  //#endregion

  //#region Methods

  addApprover(record: Approvals.RegisterApprovalRecord) {
    const insertBeforeIndex = this.approvers.findIndex(
      (x) => x.order > record.order
    )
    const index =
      insertBeforeIndex > -1 ? insertBeforeIndex - 1 : this.approvers.length
    this.approvers.splice(index, 0, {
      ...record,
      ...{ approval_post_nm: record.record_nm }
    })
    this.reorderApprovers()
    this.updateVuexState()
  }

  reorderApprovers() {
    this.approvers.forEach((x, i) => {
      x.order = i + 1
    })
  }

  removeEmployee(employee: Employee.EmployeeAffiliation) {
    const index = this.approvers.findIndex(
      (x) => x.approval_emp_id === employee.emp_id
    )
    this.approvers.splice(index, 1)
    this.updateVuexState()
  }

  updateVuexState() {
    this.setListApprovers(this.approvers)
  }
  //#endregion
}
</script>

<template>
  <v-container fluid px-0>
    <div class="text-h5 txt-text-1 mb-2">{{ contents.LIST_OF_APPROVER }}</div>
    <ApprovalAddEmployee @addRecord="addApprover" :allowOrder="true" />
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
          @start="drag = true"
          @end="drag = false"
          v-bind="dragOptions"
          item-key="order"
        >
          <tr v-for="(item, index) in props.items" :key="index">
            <td>{{ index + 1 }}</td>
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
