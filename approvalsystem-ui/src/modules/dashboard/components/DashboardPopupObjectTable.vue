<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
@Component({ components: {} })
export default class DashboardPopupObjectTable extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  //#region COMPUTED
  get contents() {
    return this.$pageContents.DASHBOARD
  }
  //#endregion
  //dummy data for table
  //table header and set value
  searchHeader = [
    { text: 'No', align: 'center', sortable: false, value: 'index' },
    { text: 'コード', align: 'center', value: 'code' },
    { text: '名称', align: 'center', value: 'name' },
    { text: '住所', align: 'center', value: 'content' },
    { text: 'グループ', align: 'center', value: 'group' },
    { text: '担当者', align: 'center', value: 'staff' },
    { text: '電話番号', align: 'center', value: 'telnumber' }
  ]
  // //#end
  // //list applicants
  searchResults = [
    {
      index: 1,
      code: '1111111',
      name: '〇〇〇〇管理組合',
      content: '大阪府大阪市〇丁〇号〇番',
      group: '鈴木　□□',
      staff: '□□ 太郎',
      telnumber: '000-000-000'
    },
    {
      index: 2,
      code: '2222222',
      name: '□□□□管理組合',
      content: '大阪府大阪市×丁×号×番',
      group: '鈴木　△△',
      staff: '△△ 太郎',
      telnumber: '000-000-111'
    },
    {
      index: 3,
      code: '3333333',
      name: '△△△△住宅部会',
      content: '大阪府大阪市△丁△号△番',
      group: '鈴木　××',
      staff: '×× 太郎',
      telnumber: '000-000-222'
    },
    {
      index: 4,
      code: '4444444',
      name: '〇〇〇〇センター',
      content: '大阪府大阪市△丁△号△番',
      group: '鈴木　〇〇',
      staff: '〇〇 太郎',
      telnumber: '000-000-333'
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
      :items="searchResults"
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
