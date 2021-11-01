<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
@Component({ components: {} })
export default class DashboardPopupObjectTable extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  //#region COMPUTED
  get contents() {
    return this.$pageContents.DASHBOARD
  }
  items: Dashboard.DashboardPropertySearchTable[] = []
  // 検索ボタン押下でデータを取得
  async getpropartydata() {
    const [err, res] = await this.$api.property.getPropertySearchRecord()
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
  Header = [
    { text: 'コード', align: 'center', value: 'property_id' },
    { text: '名称', align: 'center', value: 'property_nm' },
    { text: '住所', align: 'center', value: 'address' },
    { text: '担当者', align: 'center', value: 'emp_cd.emp_nm' },
    { text: '電話番号', align: 'center', value: 'tel_number' }
  ]
  // //#end
  // //list applicants
  //#end
  handleSelect(value) {
    this.$emit('applicationCotent', value)
  }
}
</script>

<template>
  <div class="dashboard__list">
    <v-data-table
      :headers="Header"
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
