<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import ApprovalRoutes from '@/modules/approval/components/ApprovalRoutes.vue'
import ApprovalRequestHeader from '@/modules/approval/components/ApprovalRequestHeader.vue'
import ApprovalMainFunction from '@/modules/approval/components/ApprovalMainFunction.vue'
import ApprovalRequestDetail from '@/modules/approval/components/ApprovalRequestDetail.vue'
import ApprovalSubFunction from '@/modules/approval/components/ApprovalSubFunction.vue'
import ApprovalComment from '@/modules/approval/components/ApprovalComment.vue'

@Component({
  components: {
    ApprovalRoutes,
    ApprovalRequestHeader,
    ApprovalMainFunction,
    ApprovalRequestDetail,
    ApprovalSubFunction,
    ApprovalComment
  }
})
export default class Approval extends Vue {
  //#region Data
  items: Approvals.ApprovalRouteResponse[] = []
  //#endregion

  //#region Computed
  get approvalId() {
    const id = this.$route.query.id
    return id ? id.toString() : ''
  }
  //#endregion

  //#region Hooks
  async mounted() {
    if (this.approvalId) {
      const [err, res] = await this.$api.approval.getApprovals(this.approvalId)
      if (!err && res) {
        this.items = res
      }
    }
  }
  //#endregion

  //#region Methods
  updateApprovalStatus(data: Approvals.ApprovalRouteDetailResponse) {
    const route = this.items.find(
      (t) => t.approval_route_id === data.approval_route_id
    )
    if (!route) return
    const routeDetail = route.approval_route_details.find(
      (t) => t.detail_no === data.detail_no
    )
    if (!routeDetail) return
    routeDetail.approval_status = data.approval_status
  }
  //#endregion
}
</script>

<template>
  <v-container fluid px-8>
    <ApprovalRoutes :items="items" class="mb-5" />
    <v-card class="pa-5">
      <ApprovalRequestHeader class="flex-grow-1" />
      <v-container fluid pa-0 class="d-flex mt-5 justify-center flex-gap-4">
        <ApprovalRequestDetail class="flex-grow-1" />
        <ApprovalMainFunction @approval="updateApprovalStatus" />
      </v-container>
    </v-card>
    <ApprovalSubFunction :commentCount="123" />
  </v-container>
</template>

<style lang="scss" scoped></style>
