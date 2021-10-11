<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import DashboardDetailTable from '@/modules/dashboard/components/DashboardDetailTable.vue'
import DashboardDetailPopup from '@/modules/dashboard/components/DashboardDetailPopup.vue'
import moment from 'moment'
Vue.prototype.moment = moment
@Component({
  components: {
    DashboardDetailTable,
    DashboardDetailPopup
  }
})
export default class DashboardDetail extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  //dummy data for select
  selectStatus = [
    { state: 'Florida', abbr: 'FL' },
    { state: 'Georgia', abbr: 'GA' },
    { state: 'Nebraska', abbr: 'NE' },
    { state: 'California', abbr: 'CA' },
    { state: 'New York', abbr: 'NY' }
  ]

  applicantContent = ''
  //set data for application date
  //define show popup application date
  showApplicationDate = false
  //set range data application date
  ApplicationDates = [
    moment().format('YYYY-MM-DD'),
    moment().add(7, 'days').format('YYYY-MM-DD')
  ]
  //#end
  //set data application latest date
  showApplicationLatestDate = false
  ApplicationLatestDates = [
    moment().format('YYYY-MM-DD'),
    moment().add(7, 'days').format('YYYY-MM-DD')
  ]
  //#end
  //set approval date
  showApprovalDate = false
  ApprovalDates = [
    moment().format('YYYY-MM-DD'),
    moment().add(7, 'days').format('YYYY-MM-DD')
  ]
  //#end
  //#region COMPUTED
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
    this.applicantContent = value.department
  }
  //#endregion
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
              <td>
                <v-text-field
                  dense
                  outlined
                  disabled
                  background-color="#eee"
                  placeholder="input here ..."
                  hide-details="auto"
                />
              </td>
              <td>
                <v-btn small color="grey">{{ contents.FORM_SEARCH }}</v-btn>
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
                  placeholder="input here ..."
                  hide-details="auto"
                  disabled
                  background-color="#eee"
                />
              </td>
              <td>
                <v-btn small color="grey">{{ contents.FORM_SEARCH }}</v-btn>
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
              <td>
                <v-text-field
                  dense
                  disabled
                  background-color="#eee"
                  outlined
                  placeholder="input here ..."
                  hide-details="auto"
                />
              </td>
              <td>
                <v-btn small color="grey">{{ contents.FORM_SEARCH }}</v-btn>
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
              <td>
                <v-text-field
                  dense
                  disabled
                  background-color="#eee"
                  outlined
                  placeholder="input here ..."
                  hide-details="auto"
                />
              </td>
              <td>
                <v-btn small color="grey">{{ contents.FORM_SEARCH }}</v-btn>
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
          <v-btn elevation="2" large class="group__action--primary">
            {{ contents.FORM_SEARCH }}
          </v-btn>
          <v-btn elevation="2" large class="group__action--secondary">
            {{ contents.FORM_CLEAR }}
          </v-btn>
        </div>
      </div>
    </div>
    <DashboardDetailTable />
  </div>
</template>

<style lang="scss" scoped></style>
