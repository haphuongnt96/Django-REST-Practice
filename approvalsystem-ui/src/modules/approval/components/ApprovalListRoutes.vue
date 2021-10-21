<script lang="ts">
import ApprovalRecord from '@/modules/approval/components/ApprovalRecord.vue'
import { Component, Prop, Vue } from 'vue-property-decorator'
// eslint-disable-next-line @typescript-eslint/no-var-requires
const groupBy = require('lodash.groupby')
@Component({
  components: {
    ApprovalRecord
  }
})
export default class ApprovalListRoutes extends Vue {
  //#region Prop
  @Prop({
    default: function () {
      return []
    }
  })
  items: Approvals.ApprovalRouteResponse[]
  //#endregion

  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  panel = [0]
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
}
</script>

<template>
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
                  <td>{{ item.created | date('yyyy/MM/dd') }}</td>
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

.v-divider {
  border-top-width: 2px;
  border-color: $pink-2;
}
</style>
