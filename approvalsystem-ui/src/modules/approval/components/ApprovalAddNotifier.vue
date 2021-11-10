<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import mock from '@/static/add-notifier'
import PopSearchEmployee from '@/modules/employee/components/PopSearchEmployee.vue'

@Component({
  components: { PopSearchEmployee }
})
export default class ApprovalAddNotifier extends Vue {
  //#region Data
  notifiers = mock.listNotifiers
  positionSearch = ''
  employee = {} as Employee.Employee

  //#endregion

  //#region Methods
  setEmployee(item: Employee.Employee) {
    this.employee = item
  }
  //#endregion

  //#region Computed
  get headers() {
    return [
      { text: this.contents.POSITION, value: 'position' },
      { text: this.contents.NAME, value: 'name' },
      { text: this.contents.CONFIRMED_DATE, value: 'date' }
    ]
  }
  get items() {
    return this.notifiers.filter((x) =>
      x.position.includes(this.positionSearch)
    )
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
    <div class="d-flex align-center flex-gap-8 mb-3">
      <div class="d-flex align-center flex-gap-2">
        <div>{{ contents.ADD_NOTIFIERS }}</div>
        <div class="d-flex pa-2 text-body-1 txt-white employee__summary">
          <span>{{ employee.emp_cd }}</span>
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
          v-model="positionSearch"
        />
      </div>
      <v-spacer />
      <v-btn color="secondary">{{ contents.ADD }}</v-btn>
    </div>
    <v-data-table
      :headers="headers"
      :items="items"
      :no-data-text="contents.TABLE_NO_DATA"
    >
      <template v-slot:item.date="{ item }">
        {{ item.date | date }}
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
