<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
@Component({ components: {} })
export default class PopSearchEmployeeTable extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  //#region COMPUTED
  get contents() {
    return this.$pageContents.DASHBOARD
  }
  //#endregion
  //dummy data for table
  //table header and set value
  searchHeader = [
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
  // //#end
  // //list applicants
  searchResults = [
    {
      index: 1,
      department: 'パソコン導入依頼書',
      emID: '000001',
      emName: '依頼書の申請'
    },
    {
      index: 2,
      department: 'パソコン導入依頼書',
      emID: '000002',
      emName: '依頼書の申請'
    },
    {
      index: 3,
      department: 'パソコン導入依頼書',
      emID: '000003',
      emName: '依頼書の申請'
    },
    {
      index: 4,
      department: 'パソコン導入依頼書',
      emID: '000004',
      emName: '依頼書の申請'
    },
    {
      index: 5,
      department: 'パソコン導入依頼書',
      emID: '000005',
      emName: '依頼書の申請'
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
