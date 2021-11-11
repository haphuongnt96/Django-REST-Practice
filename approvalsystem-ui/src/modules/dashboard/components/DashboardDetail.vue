<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import DashboardDetailTable from '@/modules/dashboard/components/DashboardDetailTable.vue'
import DashboardDetailPopup from '@/modules/dashboard/components/DashboardDetailPopup.vue'
import DashboardPopupNoti from '@/modules/dashboard/components/DashboardPopupNoti.vue'
import DashboardPopupObject from '@/modules/dashboard/components/DashboardPopupObject.vue'
import PopSearchEmployee from '@/modules/employee/components/PopSearchEmployee.vue'
import moment from 'moment'
Vue.prototype.moment = moment
@Component({
  components: {
    DashboardDetailTable,
    DashboardDetailPopup,
    DashboardPopupNoti,
    DashboardDetailPopup,
    DashboardPopupObject,
    PopSearchEmployee
  }
})
export default class DashboardDetail extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  //dummy data for select
  selectStatus = [
    { state: '', abbr: 'KU' },
    { state: '下書き', abbr: 'SITA' },
    { state: '申請中', abbr: 'SIN' },
    { state: '承認済', abbr: 'SHO' },
    { state: '未承認', abbr: 'MI' },
    { state: '未承認（順番待）', abbr: 'MIJ' },
    { state: '承認済（未完了分）', abbr: 'SHOMI' },
    { state: '承認済（申請取消）', abbr: 'SHOTORI' },
    { state: '不在通知', abbr: 'FU' },
    { state: '差戻', abbr: 'SASHI' },
    { state: '差戻取消', abbr: 'SASHITORI' }
  ]

  applicantContent = ''
  applicantEmpCode = ''
  applicantEmpName = ''
  notiEmpCode = ''
  notiEmpName = ''
  formEmpCode = ''
  formEmpName = ''
  noti = ''
  formObject = ''
  values = []
  //set data for application date　申請日の日付をセット
  //define show popup application date ポップアップ表示の適用日を定義
  showApplicationDate = false
  //set range data application date　日付範囲のデータをセット
  ApplicationDates = [
    moment().format('YYYY-MM-DD'),
    moment().add(7, 'days').format('YYYY-MM-DD')
  ]
  //#end
  //set data application latest date　最新の日付を設定
  showApplicationLatestDate = false
  ApplicationLatestDates = [
    moment().format('YYYY-MM-DD'),
    moment().add(7, 'days').format('YYYY-MM-DD')
  ]
  //#end
  //set approval date　承認日を設定
  showApprovalDate = false
  ApprovalDates = [
    moment().format('YYYY-MM-DD'),
    moment().add(7, 'days').format('YYYY-MM-DD')
  ]
  //#end
  //#region COMPUTED 算出プロパティで実行
  get contents() {
    return this.$pageContents.DASHBOARD
  }
  get getApplicationDates() {
    return this.ApplicationDates.join(' ~ ')
  }
  get getApplicationLatestDates() {
    return this.ApplicationLatestDates.join(' ~ ')
  }
  get getApprovalDates() {
    return this.ApprovalDates.join(' ~ ')
  }

  setDataSearch(value) {
    this.applicantContent = value.applicationcontents_nm
  }
  setDataApplicant(data) {
    this.applicantEmpCode = data.emID
    this.applicantEmpName = data.emName
  }
  setDataNoti(data) {
    this.notiEmpCode = data.emID
    this.notiEmpName = data.emName
  }
  setDataForm(data) {
    this.formEmpCode = data.emID
    this.formEmpName = data.emName
  }
  setObjectData(data) {
    this.formObject = data.property_nm
  }
  //#endregion  // 検索ボタン押下でDetailTableの検索を発火
  getDetailTable() {
    this.$refs.detailtable.getdata()
  }
}
</script>

<template>
  <div class="dashboard__content">
    <div class="app__form">
      <div class="app__form--left">
        <table class="dash__control">
          <tbody>
            <tr>
              <td>
                <label for="">{{ contents.FORM_APPLICANT_CONTENT }}</label>
              </td>
              <td>
                <v-text-field
                  dense
                  disabled
                  background-color="#eee"
                  outlined
                  v-model="applicantContent"
                  placeholder="input here ..."
                  hide-details="auto"
                />
              </td>
              <td>
                <DashboardDetailPopup @setDataSearch="setDataSearch" />
              </td>
            </tr>
            <tr>
              <td>
                <label for="">
                  {{ contents.FORM_APPLICANT_CONTENT_SEARCH }}
                </label>
              </td>
              <td>
                <v-text-field
                  dense
                  outlined
                  placeholder="input here ..."
                  hide-details="auto"
                />
              </td>
              <td></td>
            </tr>
            <tr>
              <td>
                <label for="">{{ contents.FORM_STATUS }}</label>
              </td>
              <td>
                <v-select
                  :items="selectStatus"
                  :label="contents.FORM_STATUS"
                  item-text="state"
                  item-value="abbr"
                  dense
                  outlined
                  hide-details="auto"
                />
              </td>
              <td></td>
            </tr>
            <tr>
              <td>
                <label for="">{{ contents.FORM_APPLICANT }}</label>
              </td>
              <td class="select-deparment inline-input-nmr">
                <v-text-field
                  v-model="applicantEmpCode"
                  dense
                  outlined
                  hide-details="auto"
                ></v-text-field>
                <v-text-field
                  v-model="applicantEmpName"
                  dense
                  outlined
                  hide-details="auto"
                ></v-text-field>
              </td>
              <td>
                <PopSearchEmployee @setData="setDataApplicant" />
              </td>
            </tr>
            <tr>
              <td>
                <label for="">{{ contents.FORM_APPLICANT_DEPARTMENT }}</label>
              </td>
              <td>
                <v-text-field
                  dense
                  outlined
                  placeholder="input here ..."
                  hide-details="auto"
                />
              </td>
              <td></td>
            </tr>
            <tr>
              <td>
                <label for="">{{ contents.FORM_APPLICANT_DATE }}</label>
              </td>
              <td>
                <v-menu
                  v-model="showApplicationDate"
                  :close-on-content-click="false"
                  transition="scale-transition"
                  offset-y
                  min-width="auto"
                >
                  <template v-slot:activator="{ on }">
                    <v-text-field
                      v-model="getApplicationDates"
                      append-icon="mdi-calendar"
                      v-on="on"
                      dense
                      outlined
                      hide-details="auto"
                      readonly
                    ></v-text-field>
                  </template>
                  <v-date-picker
                    v-model="ApplicationDates"
                    locale="ja"
                    range
                  ></v-date-picker>
                </v-menu>
              </td>
              <td></td>
            </tr>
            <tr>
              <td>
                <label for="">{{ contents.FORM_APPLICANT_LATEST_DATE }}</label>
              </td>
              <td>
                <v-menu
                  v-model="showApplicationLatestDate"
                  :close-on-content-click="false"
                  transition="scale-transition"
                  offset-y
                  min-width="auto"
                >
                  <template v-slot:activator="{ on }">
                    <v-text-field
                      v-model="getApplicationLatestDates"
                      append-icon="mdi-calendar"
                      v-on="on"
                      dense
                      outlined
                      hide-details="auto"
                      readonly
                    ></v-text-field>
                  </template>
                  <v-date-picker
                    v-model="ApplicationLatestDates"
                    range
                    locale="ja"
                  ></v-date-picker>
                </v-menu>
              </td>
              <td></td>
            </tr>
            <tr>
              <td>
                <label for="">{{ contents.FORM_SUBJECT }}</label>
              </td>
              <td>
                <v-text-field
                  dense
                  outlined
                  placeholder="input here ..."
                  hide-details="auto"
                />
              </td>
              <td></td>
            </tr>
            <tr>
              <td>
                <label for="">{{ contents.FORM_OBJECT }}</label>
              </td>
              <td>
                <v-text-field
                  dense
                  outlined
                  v-model="formObject"
                  placeholder="input here ..."
                  hide-details="auto"
                  disabled
                  background-color="#eee"
                />
              </td>
              <td>
                <DashboardPopupObject @setObjectData="setObjectData" />
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="app__form--right">
        <table class="dash__control">
          <tbody>
            <tr>
              <td>
                <label for="">{{ contents.FORM_APPROVER }}</label>
              </td>
              <td class="select-deparment inline-input-nmr">
                <v-text-field
                  v-model="formEmpCode"
                  dense
                  outlined
                  hide-details="auto"
                ></v-text-field>
                <v-text-field
                  v-model="formEmpName"
                  dense
                  outlined
                  hide-details="auto"
                ></v-text-field>
              </td>
              <td>
                <PopSearchEmployee @setData="setDataForm" />
              </td>
            </tr>
            <tr>
              <td>
                <label for="">{{ contents.FORM_APPROVAL_DATE }}</label>
              </td>
              <td>
                <v-menu
                  v-model="showApprovalDate"
                  :close-on-content-click="false"
                  transition="scale-transition"
                  offset-y
                  min-width="auto"
                >
                  <template v-slot:activator="{ on }">
                    <v-text-field
                      v-model="getApprovalDates"
                      append-icon="mdi-calendar"
                      v-on="on"
                      dense
                      outlined
                      hide-details="auto"
                      readonly
                    ></v-text-field>
                  </template>
                  <v-date-picker
                    v-model="ApprovalDates"
                    locale="ja"
                    range
                  ></v-date-picker>
                </v-menu>
              </td>
              <td></td>
            </tr>
            <tr>
              <td>
                <label for="">{{ contents.FORM_NOTIFIER }}</label>
              </td>
              <td class="select-deparment inline-input-nmr">
                <v-text-field
                  v-model="notiEmpCode"
                  dense
                  outlined
                  hide-details="auto"
                ></v-text-field>
                <v-text-field
                  v-model="notiEmpName"
                  dense
                  outlined
                  hide-details="auto"
                ></v-text-field>
              </td>
              <td>
                <PopSearchEmployee @setData="setDataNoti" />
              </td>
            </tr>
            <tr>
              <td>
                <label for="">{{ contents.FORM_RECEIPT_NUMBER }}</label>
              </td>
              <td>
                <v-text-field
                  dense
                  outlined
                  placeholder="input here ..."
                  hide-details="auto"
                />
              </td>
              <td></td>
            </tr>
          </tbody>
        </table>
        <table class="dash__control">
          <tbody>
            <tr>
              <td>
                <v-checkbox
                  :label="contents.CHECK_ONLY_SUBJECT"
                  hide-details="auto"
                  dense
                ></v-checkbox>
              </td>
              <td>
                <v-checkbox
                  :label="contents.CHECK_UNCONFIRMED_ONLY"
                  hide-details="auto"
                  dense
                ></v-checkbox>
              </td>
            </tr>
            <tr>
              <td>
                <v-checkbox
                  :label="contents.CHECK_ABSENCE"
                  hide-details="auto"
                  dense
                ></v-checkbox>
              </td>
              <td>
                <v-checkbox
                  :label="contents.CHECK_APPLICATION_CANCELLATION"
                  hide-details="auto"
                  dense
                ></v-checkbox>
              </td>
            </tr>
            <tr>
              <td>
                <v-checkbox
                  :label="contents.CHECK_BROWSING_AUTHORITY"
                  hide-details="auto"
                  dense
                ></v-checkbox>
              </td>
              <td></td>
            </tr>
          </tbody>
        </table>
        <div class="group__action">
          <v-btn
            elevation="2"
            large
            class="group__action--primary"
            @click="getDetailTable()"
          >
            {{ contents.FORM_SEARCH }}
          </v-btn>
          <v-btn elevation="2" large class="group__action--secondary">
            {{ contents.FORM_CLEAR }}
          </v-btn>
        </div>
      </div>
    </div>
    <DashboardDetailTable ref="detailtable" />
  </div>
</template>

<style lang="scss" scoped></style>
