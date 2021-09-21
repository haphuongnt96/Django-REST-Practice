<script lang="ts">
import { Component, Emit, Prop, Vue } from 'vue-property-decorator'

@Component({
  components: {}
})
export default class ApprovalRequestDetailFiles extends Vue {
  //#region Props
  @Prop({
    default: function () {
      return []
    }
  })
  files: File[]
  //#endregion

  //#region Emit
  @Emit('remove') removeFile(index: number) {
    return index
  }
  //#endregion
}
</script>

<template>
  <div v-if="files.length">
    <div v-for="(file, i) in files" :key="i" class="text-body-2 fw-500 mb-2">
      {{ file.name }}
      <v-icon class="cta" color="error" @click="removeFile(i)">
        mdi-close-circle
      </v-icon>
    </div>
  </div>
</template>

<style lang="scss" scoped></style>
