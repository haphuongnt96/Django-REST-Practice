<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'

@Component({ components: {} })
export default class AppDefaultHeader extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data

  get contents() {
    return this.$pageContents.APP_HEADER
  }
}
</script>

<template>
  <v-app-bar app fixed dense color="primary">
    <div class="text-h6 txt-white">{{ contents.title }}</div>
    <v-spacer />
    <div class="txt-white mr-3">{{ contents.USER_LOGIN }}</div>
    <v-btn small color="warning">
      {{ contents.LOGOUT }}
    </v-btn>
  </v-app-bar>
</template>

<style lang="scss" scoped></style>
