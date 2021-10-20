<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'

@Component({ components: {} })
export default class AppFullscreenLayout extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
}
</script>

<template>
  <v-main>
    <v-layout column fill-height fill-width>
      <v-flex class="flex overflow-auto">
        <router-view></router-view>
      </v-flex>
    </v-layout>
  </v-main>
</template>

<style lang="scss" scoped></style>
