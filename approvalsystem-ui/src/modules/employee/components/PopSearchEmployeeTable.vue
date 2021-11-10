<script lang="ts">
import { Component, Emit, Vue } from 'vue-property-decorator'
import { GetUserListRequestParams } from 'src/services/interfaces/aip_interfaces'

@Component({ components: {} })
export default class PopSearchEmployeeTable extends Vue {
  //#region Data
  items: Employee.Employee[] = []
  //#endregion

  // 検索ボタン押下でデータを取得
  async getdata(emp_nm: string, department_id: string, division_id: string) {
    const data: GetUserListRequestParams = {
      emp_nm: emp_nm,
      department_id: department_id,
      division_id: division_id
    }
    const [err, res] = await this.$api.authen.getUserList(data)
    if (!err && res) {
      //正常処理　swalはアラート用のライブラリ
      this.items = res
    } else {
      //バックエンド側でエラーが発生したときのメッセージ
      this.$swal({
        title: 'エラー',
        text: err.response.data.message,
        icon: 'error'
      })
    }
  }

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
      value: 'affiliations[0].department_nm'
    },
    { text: '社員コード', align: 'center', value: 'emp_cd' },
    { text: '社員名', align: 'center', value: 'emp_nm' }
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
