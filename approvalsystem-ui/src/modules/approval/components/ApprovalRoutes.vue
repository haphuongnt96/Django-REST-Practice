<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import ApprovalRecord from '@/modules/approval/components/ApprovalRecord.vue'
import moment from 'moment'
// eslint-disable-next-line @typescript-eslint/no-var-requires
const groupBy = require('lodash.groupby')
//using moment js to convert date,time
Vue.prototype.moment = moment
@Component({ components: { ApprovalRecord } })
export default class ApprovalRoutes extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  applicantUserHeaders = [
    { text: '申請者', value: 'request_emp_fullname', align: 'center' }
  ]
  items: Approvals.ApprovalRouteResponse[] = []
  panel = [0]
  // Vue.prototype.moment = moment
  //#region Computed
  get contents() {
    return this.$pageContents.APPROVAL
  }

  get routeDetailsGrouped() {
    return (details: Approvals.ApprovalRouteDetailResponse[]) => {
      return groupBy(details, 'approval_post_nm')
    }
  }
  //#endregion

  //#region Hook
  async mounted() {
    const [err, res] = await this.$api.approval.getApprovals('1')
    if (!err && res) {
      this.items = res.data
    }
  }
  updateApprovalStatus(data) {
    const route = this.items.find(
      (t) => t.approval_route_id === data.approval_route_id
    )
    let routeDetail = route.approval_route_details.find(
      (t) => t.detail_no === data.detail_no
    )
    routeDetail.approval_status = data.approval_status
  }
  //#endregion
}
</script>

<template>
  <v-container pa-0 fluid class="d-flex">
    <perfect-scrollbar class="d-flex flex-column flex-grow-1 bg-white">
      <v-card flat class="px-5" :style="{ height: '100%' }">
        <v-expansion-panels flat v-model="panel" multiple>
          <v-expansion-panel v-for="(item, i) in items" :key="i">
            <v-divider v-if="i" class="bg-pink-2 mb-2" />
            <v-expansion-panel-header class="px-0">
              承認状況: {{ item.approval_route_id }}
            </v-expansion-panel-header>
            <v-expansion-panel-content>
              <div class="d-box flex-gap-4">
                <v-simple-table class="table__applicant">
                  <template v-slot:default>
                    <thead>
                      <tr>
                        <th class="text-center">
                          {{ '申請者' }}
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr class="text-center">
                        <td>{{ item.request_emp_nm || 'データなし' }}</td>
                      </tr>
                      <tr class="text-center">
                        <td>{{ moment(item.created).format('YYYY/M/D') }}</td>
                      </tr>
                    </tbody>
                  </template>
                </v-simple-table>
                <div
                  v-for="(value, key) in routeDetailsGrouped(
                    item.approval_route_details
                  )"
                  :key="key"
                >
                  <ApprovalRecord :header="key" :items="value" />
                </div>
              </div>
            </v-expansion-panel-content>
          </v-expansion-panel>
        </v-expansion-panels>
      </v-card>
    </perfect-scrollbar>
    <v-divider vertical class="mx-4" />
    <v-card
      flat
      class="approval__btns d-flex flex-column align-left flex-gap-8 pa-5"
    >
      <div class="d-flex align-center flex-gap-1">
        <v-btn width="120" :color="$config.Colors.blue1">コメント</v-btn>
        <div class="comment__status">有</div>
      </div>
      <v-btn width="120" :color="$config.Colors.red1">
        {{ contents.APPROVER }}
      </v-btn>
      <v-btn width="120" :color="$config.Colors.red1">
        {{ contents.ANNOUNT_PERSON }}
      </v-btn>
      <v-btn width="120" :color="$config.Colors.red1">
        {{ contents.COPY_FUNCTION }}
      </v-btn>
    </v-card>
  </v-container>
</template>

<style lang="scss" scoped>
$sectionBtnWidth: 270px;
::v-deep {
  .table__applicant {
    height: fit-content;
    th,
    td {
      border: solid 1px #000;
    }
    th {
      background: $pink-2;
    }
  }
  .v-expansion-panel {
    background: transparent !important;
  }
  .v-expansion-panel-content__wrap {
    padding: 0;
  }
}
.d-box {
  display: -webkit-box;
  overflow: auto;
}

.ps {
  height: 300px;
}

.approval__btns {
  width: $sectionBtnWidth;
}

.comment__status {
  border: solid thin $pink-2;
  height: 36px;
  padding: 0 12px;
  background: $white;
}

.v-divider {
  border-top-width: 2px;
  border-color: $pink-2;
}

.v-btn {
  color: $white;
}
</style>
