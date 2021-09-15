<script lang="ts">
import { Routes } from '@/router'
import { Component, Vue } from 'vue-property-decorator'

@Component({ components: {} })
export default class AppDefaultSidebar extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  items = [
    {
      title: 'Dashboard',
      icon: 'mdi-view-dashboard',
      to: Routes.dashboard.path
    },
    {
      title: 'Approval',
      icon: 'mdi-file-document-edit-outline',
      to: Routes.approval.path
    }
  ]

  get contents() {
    return this.$pageContents.APP_SIDE_BAR
  }
}
</script>

<template>
  <v-navigation-drawer width="237" app fixed persistent>
    <v-list-item>
      <v-list-item-content>
        <v-list-item-title class="text-h6">
          {{ contents.title }}
        </v-list-item-title>
      </v-list-item-content>
    </v-list-item>

    <v-divider></v-divider>

    <v-list dense nav>
      <v-list-item v-for="item in items" :key="item.title" link :to="item.to">
        <v-list-item-icon>
          <v-icon>{{ item.icon }}</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>{{ item.title }}</v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </v-list>
  </v-navigation-drawer>
</template>

<style lang="scss" scoped></style>
