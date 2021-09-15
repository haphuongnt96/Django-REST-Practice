<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import ApprovalRecord from '@/modules/approval/components/ApprovalRecord.vue'
// eslint-disable-next-line @typescript-eslint/no-var-requires
const groupBy = require('lodash.groupby')

@Component({ components: { ApprovalRecord } })
export default class Approval extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  applicantUserHeaders = [
    { text: '申請者', value: 'request_emp_fullname', align: 'center' }
  ]
  items: Approvals.ApprovalRouteResponse[] = []

  get applicantUsers() {
    return (name: string) => {
      return [
        {
          request_emp_fullname: name
        }
      ]
    }
  }

  get routeDetailsGrouped() {
    return (details: Approvals.ApprovalRouteDetailResponse[]) => {
      return groupBy(details, 'organization_path')
    }
  }

  async mounted() {
    const [err, res] = await this.$api.approval.getApprovals('1')
    if (!err && res) this.items = res
  }
}
</script>

<template>
  <v-container fluid class="d-flex">
    <div class="d-flex flex-column approval__items flex-gap-4 px-4">
      <div v-for="(item, i) in items" :key="i">
        <v-divider v-if="i" />
        <div class="text-h6 mb-2">承認状況: {{ item.approval_route_id }}</div>
        <div class="d-flex flex-gap-4 flex-wrap">
          <v-data-table
            class="table__applicant"
            :headers="applicantUserHeaders"
            :items="applicantUsers(item.request_emp_fullname)"
            hide-default-footer
            disable-sort
            no-data-text="データなし"
          ></v-data-table>
          <div
            v-for="(value, key) in routeDetailsGrouped(
              item.approval_route_details
            )"
            :key="key"
          >
            <ApprovalRecord :header="key" :items="value" />
          </div>
        </div>
      </div>
    </div>
    <v-divider vertical />
    <div
      class="approval__btns d-flex flex-column align-center flex-gap-12 px-8"
    >
      <div class="d-flex align-center flex-gap-1">
        <v-btn width="160" color="success">コメント</v-btn>
        <div class="comment__status">有</div>
      </div>
      <v-btn width="120" color="warning">通知者</v-btn>
      <v-btn width="120" color="error">複写機能</v-btn>
    </div>
  </v-container>
</template>

<style lang="scss" scoped>
$sectionBtnWidth: 270px;
.approval__items {
  width: calc(100% - #{$sectionBtnWidth});
}

.approval__btns {
  position: fixed;
  right: 12px;
  width: $sectionBtnWidth;
}
.flex-gap-1 {
  gap: 4px;
}

.flex-gap-4 {
  gap: 16px;
}

.flex-gap-12 {
  gap: 48px;
}

.comment__status {
  border: solid thin #000;
  padding: 0 12px;
  background: #fff;
}

::v-deep {
  .table__applicant {
    height: fit-content;
    th,
    td {
      border: solid 1px #000;
    }
    th {
      background: #8faadc;
      color: #fff !important;
    }
  }
}
</style>
