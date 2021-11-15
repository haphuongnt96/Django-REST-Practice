<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
@Component({ components: {} })
export default class DashboardDetailSearchTable extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  //#region COMPUTED
  get contents() {
    return this.$pageContents.DASHBOARD
  }
  approvalTypes: Dashboard.DashboardApprovalTypeSearchTable[] = []
  // 検索ボタン押下でデータを取得
  async getApprovalTypeSearch() {
    const [err, res] =
      await this.$api.approvaltype.getApprovalTypeSearchRecord()
    if (!err && res) {
      //正常処理　swalはアラート用のライブラリ
      this.approvalTypes = res
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
  Header = [
    {
      text: 'ID',
      align: 'center',
      sortable: false,
      value: 'approval_type_id'
    },
    {
      text: '部署課名',
      align: 'center',
      value: 'segment.segment_nm'
    },
    {
      text: '分類',
      align: 'center',
      value: 'approval_class.approval_class_nm'
    },
    {
      text: '申請内容',
      align: 'center',
      value: 'approval_type_nm'
    }
  ]
  // //#end
  handleSelect(value) {
    this.$emit('applicationCotent', value)
  }
}
</script>

<template>
  <div class="dashboard__list">
    <v-data-table
      :headers="Header"
      :items="approvalTypes"
      :items-per-page="15"
      :no-data-text="contents.TABLE_NO_DATA"
      @click:row="handleSelect"
      :footer-props="{
        'disable-items-per-page': true
      }"
      class="dashboard__list--table"
    ></v-data-table>
  </div>
</template>

<style lang="scss" scoped></style>
