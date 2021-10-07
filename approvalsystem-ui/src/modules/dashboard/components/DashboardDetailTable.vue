<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
@Component({ components: {} })
export default class DetailTable extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  //#region COMPUTED
  get contents() {
    return this.$pageContents.DASHBOARD
  }
  //#endregion
  //dummy data for table
  //table header and set value
  headers = [
    {
      text: '受付番号',
      align: 'start',
      sortable: false,
      value: 'index'
    },
    {
      text: '申請内容',
      value: 'content'
    },
    { text: 'タイトル', value: 'title' },
    { text: '申請者', value: 'applicant' },
    { text: '状況', value: 'status' }
  ]
  // //#end
  // //list applicants
  applicants = [
    {
      index: 1,
      content: 'パソコン導入依頼書',
      title: 'パソコン導入依頼書の申請について',
      applicant: '管理者　 太郎',
      status: '承認中'
    },
    {
      index: 2,
      content: 'パソコン導入依頼書',
      title: 'パソコン導入依頼書の申請について',
      applicant: '管理者　 太郎',
      status: '承認中'
    },
    {
      index: 3,
      content: 'パソコン導入依頼書',
      title: 'パソコン導入依頼書の申請について',
      applicant: '管理者　 太郎',
      status: '承認中'
    },
    {
      index: 4,
      content: 'パソコン導入依頼書',
      title: 'パソコン導入依頼書の申請について',
      applicant: '管理者　 太郎',
      status: '承認中'
    },
    {
      index: 5,
      content: 'パソコン導入依頼書',
      title: 'パソコン導入依頼書の申請について',
      applicant: '管理者　 太郎',
      status: '承認中'
    },
    {
      index: 6,
      content: 'パソコン導入依頼書',
      title: 'パソコン導入依頼書の申請について',
      applicant: '管理者　 太郎',
      status: '承認中'
    },
    {
      index: 7,
      content: 'パソコン導入依頼書',
      title: 'パソコン導入依頼書の申請について',
      applicant: '管理者　 太郎',
      status: '承認中'
    },
    {
      index: 8,
      content: 'パソコン導入依頼書',
      title: 'パソコン導入依頼書の申請について',
      applicant: '管理者　 太郎',
      status: '承認中'
    },
    {
      index: 9,
      content: 'パソコン導入依頼書',
      title: 'パソコン導入依頼書の申請について',
      applicant: '管理者　 太郎',
      status: '承認中'
    },
    {
      index: 9,
      content: 'パソコン導入依頼書',
      title: 'パソコン導入依頼書の申請について',
      applicant: '管理者　 太郎',
      status: '承認中'
    },
    {
      index: 9,
      content: 'パソコン導入依頼書',
      title: 'パソコン導入依頼書の申請について',
      applicant: '管理者　 太郎',
      status: '承認中'
    },
    {
      index: 9,
      content: 'パソコン導入依頼書',
      title: 'パソコン導入依頼書の申請について',
      applicant: '管理者　 太郎',
      status: '承認中'
    },
    {
      index: 9,
      content: 'パソコン導入依頼書',
      title: 'パソコン導入依頼書の申請について',
      applicant: '管理者　 太郎',
      status: '承認中'
    },
    {
      index: 9,
      content: 'パソコン導入依頼書',
      title: 'パソコン導入依頼書の申請について',
      applicant: '管理者　 太郎',
      status: '承認中'
    },
    {
      index: 9,
      content: 'パソコン導入依頼書',
      title: 'パソコン導入依頼書の申請について',
      applicant: '管理者　 太郎',
      status: '承認中'
    },
    {
      index: 9,
      content: 'パソコン導入依頼書',
      title: 'パソコン導入依頼書の申請について',
      applicant: '管理者　 太郎',
      status: '承認中'
    },
    {
      index: 9,
      content: 'パソコン導入依頼書',
      title: 'パソコン導入依頼書の申請について',
      applicant: '管理者　 太郎',
      status: '承認中'
    },
    {
      index: 9,
      content: 'パソコン導入依頼書',
      title: 'パソコン導入依頼書の申請について',
      applicant: '管理者　 太郎',
      status: '承認中'
    },
    {
      index: 9,
      content: 'パソコン導入依頼書',
      title: 'パソコン導入依頼書の申請について',
      applicant: '管理者　 太郎',
      status: '承認中'
    }
  ]
  //#end
}
</script>

<template>
  <div class="dashboard__list">
    <v-data-table
      :headers="headers"
      :items="applicants"
      :items-per-page="15"
      :no-data-text="contents.TABLE_NO_DATA"
      :footer-props="{
        'disable-items-per-page': 'true'
      }"
      class="dashboard__list--table"
    ></v-data-table>
  </div>
</template>

<style lang="scss" scoped></style>
