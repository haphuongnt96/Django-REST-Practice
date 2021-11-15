<script lang="ts">
import { TOAST_MESSAGES } from '@/common/constant'
import EventBus from '@/common/eventBus'
import ApprovalComment from '@/modules/approval/components/ApprovalComment.vue'
import ApprovalMainFunction from '@/modules/approval/components/ApprovalMainFunction.vue'
import ApprovalRequestDetail from '@/modules/approval/components/ApprovalRequestDetail.vue'
import ApprovalRequestHeader from '@/modules/approval/components/ApprovalRequestHeader.vue'
import ApprovalRoutes from '@/modules/approval/components/ApprovalRoutes.vue'
import ApprovalSubFunction from '@/modules/approval/components/ApprovalSubFunction.vue'
import eventBus from '@/plugins/eventBus'
import { ApprovalRequestD, AuthD } from '@/store/typeD'
import { Component, Vue } from 'vue-property-decorator'
import { Getter as G, Mutation as M } from 'vuex-class'

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
  @G(...AuthD.getUser) user: Auth.User
  @G(...ApprovalRequestD.getListApprovers)
  approvals: Approvals.ApprovalRouteDetailResponse[]
  @G(...ApprovalRequestD.getListNotifies)
  notifies: Approvals.NotificationRecords[]
  @M(...ApprovalRequestD.setListApprovers) setListApprovers: (
    approvers: Approvals.ApprovalRouteDetailResponse[]
  ) => void
  @M(...ApprovalRequestD.setListNotifies) setListNotifies: (
    notifiers: Approvals.NotificationRecords[]
  ) => void

  //#region Data
  m_request_details: ApplicationForm.RequestDetail[] = []
  requests: Approvals.RegisterRequest[] = []
  // itemsの型宣言を取得
  items: Approvals.ApprovalRouteResponse[] = []
  approval_route_details: Approvals.ApprovalRouteDetailResponse[] = []
  fixed = false
  formSummary: Approvals.FormSummary = {
    emp_nm: '',
    created: '',
    approval_type_nm: '',
    department_nm: ''
  }
  approval_types: Approvals.ApprovalType[] = []
  //#endregion

  //#region Computed
  get userAffiliations() {
    return this.user.affiliations || []
  }

  get departmentId() {
    const departmentName = this.formSummary.department_nm
    const department = this.userAffiliations.find(
      (x) => x.department_nm === departmentName
    )
    return department ? department.department_id : ''
  }

  get requestID() {
    // 遷移時にDashboardから渡されたリクエストIDを取得
    const id = this.$route.query.id
    // 文字列にして返す
    return id ? id.toString() : ''
  }

  get approvalTypeId() {
    const id = this.$route.query.approval_type_id
    return id ? id.toString() : ''
  }

  get approveTypeName() {
    const approvalType = this.approval_types.find(
      (x) => x.approval_type_id === this.approvalTypeId
    )
    return approvalType ? approvalType.approval_type_nm : ''
  }

  get departmentNameRoute() {
    const department = this.userAffiliations.find(
      (x) => x.department_id == this.$route.query.department_id
    )
    return department ? department.department_nm : ''
  }
  //#endregion

  //#region Hooks
  async created() {
    if (this.approvalTypeId) {
      const [errTypes, resTypes] = await this.$api.approval.getApproveTypes()
      if (!errTypes && resTypes) {
        const { approval_types } = resTypes
        this.approval_types = approval_types
      }
      const [err, res] = await this.$api.approval.getApproveTypeById('0001')
      if (!err && res) {
        const {
          approval_route_details,
          m_request_details,
          notification_records
        } = res
        this.m_request_details = m_request_details
        this.setListApprovers(approval_route_details)
        this.setListNotifies(notification_records)
      }
      this.formSummary = {
        emp_nm: this.user.emp_nm,
        approval_type_nm: this.approveTypeName,
        approval_type_id: this.approvalTypeId,
        created: '',
        department_nm: this.departmentNameRoute
      }
    } else if (this.requestID) {
      // リクエストIDから承認ルートテーブルから取得する
      const [err, res] = await this.$api.approval.getRequestFormData(
        this.requestID
      )
      if (!err && res) {
        const {
          approval_routes,
          m_request_details,
          request_emp_nm,
          approval_type_nm,
          approval_type_id,
          department_nm,
          notification_records,
          approval_route_details,
          created
        } = res
        this.formSummary = {
          emp_nm: request_emp_nm,
          approval_type_nm,
          created,
          approval_type_id,
          department_nm
        }
        this.m_request_details = m_request_details
        this.items = approval_routes
        this.setListApprovers(approval_route_details)
        this.setListNotifies(notification_records)
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
      approval_type_id: this.formSummary.approval_type_id || '',
      request_details: this.requests,
      department_id: this.departmentId,
      approval_route_details: this.approvals,
      notification_records: this.notifies || []
    }
    const [err, res] = this.requestID
      ? await this.$api.approval.updateRequestFormData(this.requestID, data)
      : await this.$api.approval.sendRequest(data)
    if (!err && res) {
      this.$toast.fire({
        icon: 'success',
        title: TOAST_MESSAGES.APP_SAVE_SUCCESS
      })
      const { approval_routes, m_request_details, request_id } = res
      this.items = approval_routes
      this.m_request_details = m_request_details
      if (this.requestID) return
      const route = this.$router.resolve({
        name: this.$route.name || '',
        query: { id: request_id }
      })
      const { name, query } = route.route
      if (name) this.$router.push({ name, query })
    }
  }
  //#endregion
}
</script>

<template>
  <v-container fluid px-8>
    <ApprovalRoutes :items="items" class="mb-5" />
    <v-card class="pa-5 approval__container">
      <ApprovalRequestHeader class="flex-grow-1" :formSummary="formSummary" />
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
