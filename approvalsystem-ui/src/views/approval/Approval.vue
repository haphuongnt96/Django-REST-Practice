<script lang="ts">
import ApprovalComment from '@/modules/approval/components/ApprovalComment.vue'
import ApprovalMainFunction from '@/modules/approval/components/ApprovalMainFunction.vue'
import ApprovalRequestDetail from '@/modules/approval/components/ApprovalRequestDetail.vue'
import ApprovalRequestHeader from '@/modules/approval/components/ApprovalRequestHeader.vue'
import ApprovalRoutes from '@/modules/approval/components/ApprovalRoutes.vue'
import ApprovalSubFunction from '@/modules/approval/components/ApprovalSubFunction.vue'
import { Component, Vue } from 'vue-property-decorator'
import eventBus from '@/plugins/eventBus'
import EventBus from '@/common/eventBus'

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
  m_request_details: ApplicationForm.RequestDetail[] = []
  requests: Approvals.RegisterRequest[] = []
  // itemsの型宣言を取得
  items: Approvals.ApprovalRouteResponse[] = []
  fixed = false
  //#endregion

  //#region Computed
  get requestID() {
    // 遷移時にDashboardから渡されたリクエストIDを取得
    const id = this.$route.params.id
    // 文字列にして返す
    return id ? id.toString() : ''
  }

  get approvalTypeId() {
    const id = this.$route.query.approval_type_id
    return id ? id.toString() : ''
  }
  //#endregion

  //#region Hooks
  async created() {
    if (this.approvalTypeId) {
      const [err, res] = await this.$api.approval.getApproveTypeById('0001')
      if (!err && res) {
        const { m_approval_routes, m_request_details } = res
        this.m_request_details = m_request_details
        this.items = m_approval_routes
      }
    } else if (this.requestID) {
      // リクエストIDから承認ルートテーブルから取得する
      const [err, res] = await this.$api.approval.getApprovals(this.requestID)
      if (!err && res) {
        this.items = res
      }
    }
  }

  async mounted() {
    window.addEventListener('scroll', this.handleScroll)
    eventBus.$on(
      EventBus.USER_INPUT_APPLICATION_FORM,
      (value: Approvals.RegisterRequest) => {
        const existed = this.requests.find(
          (x) => x.request_column_id === value.request_column_id
        )
        if (existed) existed.request_column_val = value.request_column_val
        else this.requests.push(value)
      }
    )
  }

  beforeDestroy() {
    eventBus.$off(EventBus.USER_INPUT_APPLICATION_FORM)
  }

  //#endregion

  //#region Methods
  handleScroll() {
    const ref = this.$refs['main-function'] as Element
    if (!ref) return
    const offsetTop = ref.getBoundingClientRect().top
    if (offsetTop < 50) this.fixed = true
    else this.fixed = false
  }

  updateApprovalStatus(data: Approvals.ApprovalRouteDetailResponse) {
    // backendから取得した承認ルートIDと同一の承認ルートを探す
    const route = this.items.find(
      (t) => t.approval_route_id === data.approval_route_id
    )
    // もしルートがなかったら終了
    if (!route) return
    // ルートから承認ルートIDと同じ詳細情報を探す
    const routeDetail = route.approval_route_details.find(
      (t) => t.detail_no === data.detail_no
    )
    // もしルート詳細情報がなかったら終了
    if (!routeDetail) return
    // ルート詳細のステータスを変更する
    routeDetail.approval_status = data.approval_status
  }

  async saveDraft() {
    const data = {
      approval_type_id: this.approvalTypeId,
      request_details: this.requests
    }
    const [err, res] = await this.$api.approval.sendRequest(data)
  }
  //#endregion
}
</script>

<template>
  <v-container fluid px-8>
    <ApprovalRoutes :items="items" class="mb-5" />
    <v-card class="pa-5 approval__container">
      <ApprovalRequestHeader class="flex-grow-1" />
      <v-container fluid pa-0 class="d-flex mt-5 justify-center flex-gap-4">
        <ApprovalRequestDetail
          class="approval__detail"
          :items="m_request_details"
        />
        <div ref="main-function" :style="{ width: '160px' }">
          <ApprovalMainFunction
            :class="{ fixed }"
            @approval="updateApprovalStatus"
            @saveDraft="saveDraft"
          />
        </div>
      </v-container>
    </v-card>
    <ApprovalSubFunction :commentCount="9" />
  </v-container>
</template>

<style lang="scss" scoped>
.approval__container {
  position: relative;
}
.approval__detail {
  width: calc(100% - 160px);
}
</style>
