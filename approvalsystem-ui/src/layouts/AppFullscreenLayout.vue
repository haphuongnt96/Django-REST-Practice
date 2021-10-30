<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import AppDefaultHeader from '@/common/components/ui/AppDefaultHeader.vue'

@Component({ components: { AppDefaultHeader } })
export default class AppFullscreenLayout extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
}
</script>

<template>
  <v-main>
    <AppDefaultHeader />
    <v-layout column fill-height fill-width>
      <v-flex class="flex overflow-auto">
        <router-view></router-view>
      </v-flex>
    </v-layout>
  </v-main>
</template>

<style lang="scss" scoped></style>
