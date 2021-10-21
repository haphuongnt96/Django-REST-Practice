<script lang="ts">
import { Component, Emit, Vue } from 'vue-property-decorator'
import employee from '@/static/employee'

@Component({ components: {} })
export default class PopSearchEmployeeTable extends Vue {
  //#region Data
  items = employee
  //#endregion

  //#region Emit
  @Emit('select') select(employee: Employee.Employee) {
    return employee
  }
  //#endregion

  //#region COMPUTED
  get contents() {
    return this.$pageContents.DASHBOARD
  }
  //#endregion

  headers = [
    {
      text: 'No',
      align: 'center',
      sortable: false,
      value: 'index'
    },
    {
      text: '所属',
      align: 'center',
      value: 'department'
    },
    { text: '社員コード', align: 'center', value: 'emID' },
    { text: '社員名', align: 'center', value: 'emName' }
  ]
}
</script>

<template>
  <v-data-table
    :headers="headers"
    :items="items"
    :items-per-page="15"
    :no-data-text="contents.TABLE_NO_DATA"
    @click:row="select"
    :footer-props="{
      'disable-items-per-page': true
    }"
  >
    <template v-slot:item.index="{ index }">
      {{ index + 1 }}
    </template>
  </v-data-table>
</template>

<style lang="scss" scoped></style>
