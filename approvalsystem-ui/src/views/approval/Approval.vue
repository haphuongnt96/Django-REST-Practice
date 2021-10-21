<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import ApprovalRoutes from '@/modules/approval/components/ApprovalRoutes.vue'
import ApprovalRequestHeader from '@/modules/approval/components/ApprovalRequestHeader.vue'
import ApprovalMainFunction from '@/modules/approval/components/ApprovalMainFunction.vue'
import ApprovalRequestDetail from '@/modules/approval/components/ApprovalRequestDetail.vue'
import ApprovalSubFunction from '@/modules/approval/components/ApprovalSubFunction.vue'

@Component({
  components: {
    ApprovalRoutes,
    ApprovalRequestHeader,
    ApprovalMainFunction,
    ApprovalRequestDetail,
    ApprovalSubFunction
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
    <ApprovalRoutes ref="TDH" class="mb-5" />
    <v-card class="pa-5">
      <ApprovalRequestHeader class="flex-grow-1" />
      <v-container fluid pa-0 class="d-flex mt-5 justify-center flex-gap-4">
        <ApprovalRequestDetail class="flex-grow-1" />
        <ApprovalMainFunction @approval="approvalStatus" />
      </v-container>
    </v-card>
    <ApprovalSubFunction />
  </v-container>
</template>

<style lang="scss" scoped></style>
