<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import ApprovalRequestDetailTable from '@/modules/approval/components/ApprovalRequestDetailTable.vue'
import ApprovalRequestDetailUploader from '@/modules/approval/components/ApprovalRequestDetailUploader.vue'
import ApprovalRequestDetailFiles from '@/modules/approval/components/ApprovalRequestDetailFiles.vue'
import Form from '@/views/form/Form.vue'
import { format } from 'date-fns'

@Component({
  components: {
    Form,
    ApprovalRequestDetailTable,
    ApprovalRequestDetailUploader,
    ApprovalRequestDetailFiles
  }
})
export default class ApprovalRequestDetail extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  format = format
  items = [1, 2]
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
    <Form />
    <ApprovalRequestDetailUploader class="mt-5" @upload="upload" />
    <ApprovalRequestDetailFiles class="mt-5" :files="files" @remove="remove" />
  </div>
</template>

<style lang="scss" scoped></style>
