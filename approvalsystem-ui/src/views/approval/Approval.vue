<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import ApprovalRoutes from '@/modules/approval/components/ApprovalRoutes.vue'
import ApprovalRequestHeader from '@/modules/approval/components/ApprovalRequestHeader.vue'
import ApprovalMainFunction from '@/modules/approval/components/ApprovalMainFunction.vue'
import ApprovalRequestDetail from '@/modules/approval/components/ApprovalRequestDetail.vue'

@Component({
  components: {
    ApprovalRoutes,
    ApprovalRequestHeader,
    ApprovalMainFunction,
    ApprovalRequestDetail
  }
})
export default class Approval extends Vue {
  approvalStatus(data) {
    this.$refs.TDH.updateApprovalStatus(data)
  }
}
</script>

<template>
  <v-container fluid px-8>
    <ApprovalRoutes ref="TDH" />
    <v-container fluid pa-0 class="d-flex mt-5">
      <ApprovalRequestHeader class="flex-grow-1" />
      <v-spacer />
      <ApprovalMainFunction @approval="approvalStatus" />
    </v-container>
    <v-container fluid pa-0 class="d-flex mt-5 justify-center">
      <ApprovalRequestDetail />
    </v-container>
  </v-container>
</template>

<style lang="scss" scoped></style>
