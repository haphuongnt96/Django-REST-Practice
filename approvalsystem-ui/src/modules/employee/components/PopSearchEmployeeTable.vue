<script lang="ts">
import { Component, Emit, Prop, Vue } from 'vue-property-decorator'

@Component({ components: {} })
export default class PopSearchEmployeeTable extends Vue {
  //#region Data
  @Prop() items: Employee.EmployeeAffiliation[]
  @Prop() searchParams: Employee.SearchEmployees
  @Prop() totalItems: number
  @Prop() disabledIds: number[]
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

  get options() {
    const { limit, offset } = this.searchParams
    return {
      page: offset / limit + 1,
      itemsPerPage: limit
    }
  }

  set options(value: Vuetify.VDataTable) {
    const { itemsPerPage, page } = value
    this.$emit('update:searchParams', {
      ...this.searchParams,
      ...{
        limit: value.itemsPerPage,
        offset: (page - 1) * itemsPerPage
      }
    })
  }

  get disabledRow() {
    return (item: Employee.EmployeeAffiliation) => {
      return this.disabledIds.includes(item.emp_id)
    }
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
      value: 'department_nm'
    },
    { text: '社員コード', align: 'center', value: 'emp_id' },
    { text: '社員名', align: 'center', value: 'emp_nm' }
  ]
}
</script>

<template>
  <v-data-table
    :headers="headers"
    :items="items"
    :options.sync="options"
    :server-items-length="totalItems"
    :items-per-page="$constants.VTABLE_DATA_CONFIG.ITEMS_PER_PAGE"
    :no-data-text="$constants.VTABLE_DATA_CONFIG.TEXT_NO_DATA"
  >
    <template v-slot:body="props">
      <tr
        :class="{ disabled: disabledRow(item) }"
        v-for="(item, index) in props.items"
        :key="index"
        @click="select(item)"
      >
        <td>{{ index + 1 }}</td>
        <td>{{ item.department_nm }}</td>
        <td>{{ item.emp_id }}</td>
        <td>
          {{ item.emp_nm }}
        </td>
      </tr>
    </template>
  </v-data-table>
</template>

<style lang="scss" scoped>
td {
  text-align: center;
}

tr {
  &.disabled {
    background: $blue-2;
    color: white;
    pointer-events: none;
  }
}
</style>
