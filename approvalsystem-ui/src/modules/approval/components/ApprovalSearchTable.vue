<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
@Component({ components: {} })
export default class DashboardDetailSearchTable extends Vue {
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
      text: 'ID',
      align: 'center',
      sortable: false,
      value: 'index'
    },
    {
      text: '部署課名',
      align: 'center',
      value: 'department'
    },
    { text: '分類', align: 'center', value: 'category' },
    { text: '申請内容', align: 'center', value: 'content' }
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
