<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
@Component({ components: {} })
export default class DashboardDetailSearchTable extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  //#region COMPUTED
  get contents() {
    return this.$pageContents.DASHBOARD
  }
  items: Dashboard.DashboardApplicationContentsSearchTable[] = []
  // 検索ボタン押下でデータを取得
  async getapplicationcontentsdata() {
    const [err, res] =
      await this.$api.application_contents.getApplicationContentsSearchRecord()
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
  //#endregion
  //dummy data for table
  //table header and set value
  searchHeader = [
    {
      text: 'ID',
      align: 'center',
      sortable: false,
      value: 'applicationcontents_id'
    },
    {
      text: '部署課名',
      align: 'center',
      value: 'department'
    },
    {
      text: '分類',
      align: 'center',
      value: 'applicationclassification.applicationclassification_nm'
    },
    { text: '申請内容', align: 'center', value: 'applicationcontents_nm' }
  ]
  // //#end
  // //list applicants
  searchResults = [
    {
      index: 1,
      department: 'パソコン導入依頼書',
      category: 'パソコン導入依頼書の申請について',
      content: 'パソコン導入依頼書の申請について'
    },
    {
      index: 2,
      department: 'パソコン導入依頼書',
      category: 'パソコン導入依頼書の申請について',
      content: 'パソコン導入依頼書の申請について'
    },
    {
      index: 3,
      department: 'パソコン導入依頼書',
      category: 'パソコン導入依頼書の申請について',
      content: 'パソコン導入依頼書の申請について'
    },
    {
      index: 4,
      department: 'パソコン導入依頼書',
      category: 'パソコン導入依頼書の申請について',
      content: 'パソコン導入依頼書の申請について'
    }
  ]
  //#end
  handleSelect(value) {
    this.$emit('applicationCotent', value)
  }
}
</script>

<template>
  <div class="dashboard__list">
    <v-data-table
      :headers="searchHeader"
      :items="items"
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
