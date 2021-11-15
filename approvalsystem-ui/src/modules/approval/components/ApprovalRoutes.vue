<script lang="ts">
import ApprovalListRoutes from '@/modules/approval/components/ApprovalListRoutes.vue'
import ApprovalAddApprover from '@/modules/approval/components/ApprovalAddApprover.vue'
import ApprovalAddNotifier from '@/modules/approval/components/ApprovalAddNotifier.vue'
import { Component, Prop, Vue } from 'vue-property-decorator'
import { Getter as G } from 'vuex-class'
import { ApprovalRequestD } from '@/store/typeD'

@Component({
  components: {
    ApprovalListRoutes,
    ApprovalAddApprover,
    ApprovalAddNotifier
  }
})
export default class ApprovalRoutes extends Vue {
  @G(...ApprovalRequestD.getListApprovers)
  approval_route_details: Approvals.ApprovalRouteDetailResponse[]
  //#region Prop
  @Prop({
    default: function () {
      return []
    }
  })
  items: Approvals.ApprovalRouteResponse[]
  //#endregion

  //#region Data
  tab = 0
  //#endregion

  //#region Computed
  get contents() {
    return this.$pageContents.APPROVAL
  }

  get tabs() {
    return [
      { text: this.contents.APPROVAL_ROUTE, value: 0 },
      { text: this.contents.ADD_APPROVER, value: 1 },
      { text: this.contents.ADD_NOTIFIER, value: 2 }
    ]
  }
  //#endregion
}
</script>

<template>
  <v-container pa-0 fluid class="d-flex">
    <perfect-scrollbar class="d-flex flex-column flex-grow-1 bg-white">
      <v-card class="px-5">
        <v-tabs v-model="tab">
          <v-tab v-for="tab in tabs" :key="tab.value">
            {{ tab.text }}
          </v-tab>
        </v-tabs>
        <v-tabs-items v-model="tab">
          <v-tab-item>
            <ApprovalListRoutes
              :items="items"
              :approval_route_details="approval_route_details"
            />
          </v-tab-item>
          <v-tab-item>
            <ApprovalAddApprover
              :approval_route_details="approval_route_details"
            />
          </v-tab-item>
          <v-tab-item>
            <ApprovalAddNotifier />
          </v-tab-item>
        </v-tabs-items>
      </v-card>
    </perfect-scrollbar>
  </v-container>
</template>

<style lang="scss" scoped>
.ps {
  max-height: 50vh;
}

.v-btn {
  color: $white;
}
</style>
