<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import ApprovalAddEmployee from '@/modules/approval/components/ApprovalAddEmployee.vue'
import { Mutation as M, Getter as G } from 'vuex-class'
import { ApprovalRequestD } from '@/store/typeD'

@Component({
  components: { ApprovalAddEmployee }
})
export default class ApprovalAddNotifier extends Vue {
  @M(...ApprovalRequestD.setListNotifies) setListNotifies: (
    notifiers: Approvals.NotificationRecords[]
  ) => void
  @G(...ApprovalRequestD.getListNotifies)
  listNotifiers: Approvals.NotificationRecords[]
  //#region Data
  //#endregion

  //#region Methods
  addNotify(record: Approvals.RegisterApprovalRecord) {
    this.notifiers.push({
      notify_emp_id: record.approval_emp_id,
      notify_emp_nm: record.emp_nm,
      notification_type_nm: record.record_nm,
      notification_type_id: ''
    })
    this.notifiers = [...this.notifiers]
  }

  removeRecord(item: Approvals.NotificationRecords) {
    const index = this.notifiers.findIndex(
      (x) => x.notify_emp_id === item.notify_emp_id
    )
    this.notifiers.splice(index, 1)
    this.notifiers = [...this.notifiers]
  }
  //#endregion

  //#region Computed
  get notifiers() {
    return this.listNotifiers || []
  }

  set notifiers(value: Approvals.NotificationRecords[]) {
    this.setListNotifies(value)
  }

  get headers() {
    return [
      { text: this.contents.POSITION, value: 'notification_type_nm' },
      { text: this.contents.NAME, value: 'notify_emp_nm' },
      { text: this.contents.CONFIRMED_DATE, value: 'date' },
      { text: '', value: 'action', width: '80', align: 'center' }
    ]
  }

  get contents() {
    return { ...this.$pageContents.APPROVAL_TABS, ...this.$pageContents.COMMON }
  }
  //#endregion
}
</script>

<template>
  <v-container fluid px-0>
    <div class="text-h5 txt-text-1 mb-2">{{ contents.LIST_OF_NOTIFIERS }}</div>
    <ApprovalAddEmployee @addRecord="addNotify" />
    <v-data-table
      :headers="headers"
      :items="notifiers"
      :items-per-page="$constants.VTABLE_DATA_CONFIG.ITEMS_PER_PAGE"
      :no-data-text="$constants.VTABLE_DATA_CONFIG.TEXT_NO_DATA"
    >
      <template v-slot:item.date="{ item }">
        {{ item.date | date }}
      </template>
      <template v-slot:item.action="{ item }">
        <v-icon small :color="$config.Colors.red2" @click="removeRecord(item)">
          mdi-trash-can-outline
        </v-icon>
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
