<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'

@Component({ components: {} })
export default class MainFunction extends Vue {
  //#region COMPUTED
  get contents() {
    return this.$pageContents.APPROVAL
  }
  //#endregion
}
</script>

<template>
  <v-card flat>
    <v-card-text>
      <div class="d-flex flex-gap-4 mb-5">
        <v-btn small color="grey">{{ contents.APPLY }}</v-btn>
        <v-btn small color="grey">{{ contents.SAVE_DRAFT }}</v-btn>
        <v-btn small color="grey">{{ contents.CANCEL_APP }}</v-btn>
        <v-btn small color="grey">{{ contents.DELETE }}</v-btn>
      </div>
      <div class="d-flex flex-gap-4 mb-5">
        <v-btn small color="grey">{{ contents.APPROVE }}</v-btn>
        <v-btn small color="grey">{{ contents.DISAPPROVE }}</v-btn>
        <v-btn small color="grey">{{ contents.CANCEL }}</v-btn>
      </div>
      <v-btn small color="grey">{{ contents.PRINT }}</v-btn>
    </v-card-text>
  </v-card>
</template>

<style lang="scss" scoped></style>
