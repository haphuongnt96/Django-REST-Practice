<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator'
import ApprovalRequestDetailTable from '@/modules/approval/components/ApprovalRequestDetailTable.vue'
import ApprovalRequestDetailUploader from '@/modules/approval/components/ApprovalRequestDetailUploader.vue'
import ApprovalRequestDetailFiles from '@/modules/approval/components/ApprovalRequestDetailFiles.vue'
import Form from '@/views/form/Form.vue'

@Component({
  components: {
    Form,
    ApprovalRequestDetailTable,
    ApprovalRequestDetailUploader,
    ApprovalRequestDetailFiles
  }
})
export default class ApprovalRequestDetail extends Vue {
  //#region Prop
  @Prop({
    default: function () {
      return []
    }
  })
  items: ApplicationForm.RequestDetail[]
  //#endregion
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  files: File[] = []

  upload(files: File[]) {
    this.files = files
  }

  remove(index: number) {
    this.files.splice(index, 1)
  }
}
</script>

<template>
  <div>
    <Form :items.sync="items" />
    <ApprovalRequestDetailUploader class="mt-5" @upload="upload" />
    <ApprovalRequestDetailFiles class="mt-5" :files="files" @remove="remove" />
  </div>
</template>

<style lang="scss" scoped></style>
