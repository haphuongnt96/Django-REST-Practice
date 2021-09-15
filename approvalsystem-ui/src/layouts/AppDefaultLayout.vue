<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import AppDefaultHeader from '@/common/components/ui/AppDefaultHeader.vue'
import AppDefaultSidebar from '@/common/components/ui/AppDefaultSidebar.vue'

@Component({ components: { AppDefaultHeader, AppDefaultSidebar } })
export default class DefaultLayout extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
}
</script>

<template>
  <v-main>
    <AppDefaultHeader />
    <!-- <AppDefaultSidebar /> -->
    <v-layout column fill-height fill-width>
      <v-flex class="flex overflow-auto">
        <router-view></router-view>
      </v-flex>
      <slot name="footer"></slot>
    </v-layout>
  </v-main>
</template>

<style lang="scss" scoped></style>
