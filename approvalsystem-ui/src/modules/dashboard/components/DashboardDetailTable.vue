<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
@Component({ components: {} })
export default class DetailTable extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  //#region COMPUTED
  get contents() {
    return this.$pageContents.DASHBOARD
  }
  request_id: ''
  item: ''
  items: Dashboard.DashboardDetailTable[] = []
  // 検索ボタン押下でデータを取得
  async getdata() {
    const [err, res] = await this.$api.dashboard.getDashuboardSerchRecord()
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
  // 申請一覧のレコードクリック時に詳細画面に遷移する
  clickRow(item) {
    // クリックされたオブジェクトのrequest_idを取得して渡す
    this.request_id = item.request_id
    this.$router.push({ name: 'approval', params: { id: this.request_id } })
  }
  //#endregion

  //table header and set value
  headers = [
    {
      text: '番号',
      align: 'center',
      //sortable: false,
      value: 'request_id'
    },
    {
      text: '件名',
      align: 'center',
      value: 'request_title'
    },
    {
      text: '申請部署名',
      align: 'center',
      value: 'approvalroute[0].department.department_nm'
    },
    {
      text: '申請者',
      align: 'center',
      value: 'approvalroute[0].request_emp.emp_nm'
    },
    {
      text: '状況',
      align: 'center',
      value: 'status.status_nm'
    }
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
        @click:row="clickRow"
      ></v-data-table>
    </div>
  </div>
</template>

<style lang="scss" scoped></style>
