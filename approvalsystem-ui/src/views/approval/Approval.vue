<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import ApprovalRoutes from '@/modules/approval/components/ApprovalRoutes.vue'
import ApprovalRequestHeader from '@/modules/approval/components/ApprovalRequestHeader.vue'
import ApprovalMainFunction from '@/modules/approval/components/ApprovalMainFunction.vue'
import ApprovalRequestDetail from '@/modules/approval/components/ApprovalRequestDetail.vue'
import ApprovalSubFunction from '@/modules/approval/components/ApprovalSubFunction.vue'
import ApprovalComment from '@/modules/approval/components/ApprovalComment.vue'
// eslint-disable-next-line @typescript-eslint/no-var-requires

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
  //#endregion

  //#region Hooks
  // リクエストIDから承認ルートテーブルから取得する
  async mounted() {
    window.addEventListener('scroll', this.handleScroll)
    if (this.requestID) {
      const [err, res] = await this.$api.approval.getApprovals(this.requestID)
      if (!err && res) {
        this.items = res
      }
    }
  }

  //#endregion

  //#region Methods
  handleScroll() {
    const offsetTop = this.$el.getBoundingClientRect().top
    console.log(offsetTop)
    if (Math.abs(offsetTop) > 50) this.fixed = true
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
  //#endregion
}
</script>

<template>
  <v-container fluid px-8>
    <ApprovalRoutes :items="items" class="mb-5" />
    <v-card class="pa-5 approval__container">
      <ApprovalRequestHeader class="flex-grow-1" />
      <v-container fluid pa-0 class="d-flex mt-5 justify-center flex-gap-4">
        <ApprovalRequestDetail class="approval__detail" />
        <div :style="{ width: '160px' }">
          <ApprovalMainFunction
            @approval="updateApprovalStatus"
            :class="{ fixed }"
          />
        </div>
      </v-container>
    </v-card>
    <ApprovalSubFunction :commentCount="123" />
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
