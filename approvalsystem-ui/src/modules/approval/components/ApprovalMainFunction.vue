<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
@Component({ components: {} })
export default class MainFunction extends Vue {
  //#region COMPUTED
  get contents() {
    return this.$pageContents.APPROVAL
  }
  async handleApprove() {
    const [err, res] = await this.$api.approval.postApprovalStatus('1', {
      approval_status: '1'
    })
    if (!err && res) {
      //emit data to ApprovalRoute for update approvalStatus
      this.$emit('approval', res.data)
      this.$swal(this.contents.APPROVE_SUCCESS_MESS)
    } else {
      this.$swal(this.contents.APPROVE_FAIL_MESS)
    }
  }

  //#endregion
}
</script>

<template>
  <div class="grid">
    <v-btn small color="grey">{{ contents.APPLY }}</v-btn>
    <v-btn small color="grey">{{ contents.SAVE_DRAFT }}</v-btn>
    <v-btn small color="grey">{{ contents.CANCEL_APP }}</v-btn>
    <v-btn small color="grey">{{ contents.DELETE }}</v-btn>
    <v-btn small color="grey" @click="handleApprove()">
      {{ contents.APPROVE }}
    </v-btn>
    <v-btn small color="grey">{{ contents.DISAPPROVE }}</v-btn>
    <v-btn small color="grey">{{ contents.CANCEL }}</v-btn>
    <v-btn small color="grey">{{ contents.PRINT }}</v-btn>
  </div>
</template>

<style lang="scss" scoped>
.grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: 10px;
  height: -webkit-fill-available;
}
</style>
