<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
@Component({ components: {} })
export default class DetailTable extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  //#region COMPUTED
  get contents() {
    return this.$pageContents.DASHBOARD
  }
  items: Dashboard.DashboardDetailTable[] = []
  // 検索ボタン押下でデータを取得
  async getdata() {
    const [err, res] = await this.$api.dashboard.getDashuboardSerchRecord()
    if (!err && res) {
      //正常処理　swalはアラート用のライブラリ
      this.items = res
      console.log(res)
    } else {
      //バックエンド側でエラーが発生したときのメッセージ
      this.$swal({
        title: 'エラー',
        text: err.response.data.message,
        icon: 'error'
      })
    }
  }
  //#endregion
  //dummy data for table
  //table header and set value
  headers = [
    {
      text: '番号',
      align: 'start',
      sortable: false,
      value: 'request_id'
    },
    { text: '件名', value: 'request_title' },
    //{ text: '申請部署名', value: 'applicationdepartment' },
    { text: '申請者', value: 'approvalroute[0].request_emp_nm' },
    { text: '状況', value: 'status.status_nm' }
  ]
}
</script>

<template>
  <div>
    <div class="dashboard__list">
      <v-data-table
        :headers="headers"
        :items="items"
        :items-per-page="15"
        :no-data-text="contents.TABLE_NO_DATA"
        :footer-props="{
          'disable-items-per-page': false
        }"
        class="dashboard__list--table"
      ></v-data-table>
    </div>
  </div>
</template>

<style lang="scss" scoped></style>
