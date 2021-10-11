<script lang="ts">
import { Component, Emit, Vue } from 'vue-property-decorator'

type Uploader = Vue & {
  click: () => void
}

@Component({ components: {} })
export default class ApprovalRequestDetailUploader extends Vue {
  //#region Computed
  get uploader() {
    return this.$refs.uploader as Uploader
  }
  //#endregion

  //#region Emit
  @Emit('upload') upload(files: File[]) {
    return files
  }
  //#endregion

  //#region Methods
  handleUpload() {
    this.uploader.click()
  }

  uploaded(e: Event) {
    const target = e.target as HTMLInputElement
    const files = target.files
    if (!files) return
    this.upload([...files])
  }
  //#endregion
}
</script>

<template>
  <v-container pa-0 fluid class="d-flex" @click="handleUpload">
    <div class="flex-grow-1">添付したいファイルを選択してください</div>
    <input
      type="file"
      multiple
      class="hidden"
      ref="uploader"
      @change="uploaded"
    />
    <div>参照...</div>
  </v-container>
</template>

<style lang="scss" scoped>
.hidden {
  display: none;
}
.container {
  cursor: pointer;
  border: solid thin $grey-1;
  border-radius: 8px !important;
  > div {
    padding: 10px 12px;
    &:first-child,
    &:last-child {
      background: #eaecf0;
    }
    &:first-child {
      border-right: solid thin $grey-1;
    }
    &:last-child {
      border-left: solid thin $grey-1;
    }
  }
}
</style>
