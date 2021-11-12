<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import ApprovalAddEmployee from '@/modules/approval/components/ApprovalAddEmployee.vue'
import { Mutation as M } from 'vuex-class'
import { ApprovalRequestD } from '@/store/typeD'

@Component({
  components: { ApprovalAddEmployee }
})
export default class ApprovalAddNotifier extends Vue {
  @M(...ApprovalRequestD.setListNotifies) setListNotifies: (
    notifiers: Approvals.NotificationRecords[]
  ) => void
  //#region Data
  notifiers: Approvals.NotificationRecords[] = []

  //#endregion

  //#region Methods
  addNotify(record: Approvals.RegisterApprovalRecord) {
    this.notifiers.push({
      emp_id: record.approval_emp_id,
      notification_post_nm: record.record_nm
    })
    this.updateVuexState()
  }

  removeRecord(item: Approvals.NotificationRecords) {
    const index = this.notifiers.findIndex((x) => x.emp_id === item.emp_id)
    this.notifiers.splice(index, 1)
    this.updateVuexState()
  }

  updateVuexState() {
    this.setListNotifies(this.notifiers)
  }
  //#endregion

  //#region Computed
  get headers() {
    return [
      { text: this.contents.POSITION, value: 'emp_id' },
      { text: this.contents.NAME, value: 'notification_post_nm' },
      { text: this.contents.CONFIRMED_DATE, value: 'date' },
      { text: '', value: 'action', width: '200', align: 'center' }
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
          mdi-close
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
