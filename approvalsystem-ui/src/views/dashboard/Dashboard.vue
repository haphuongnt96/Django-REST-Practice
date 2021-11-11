<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import DashboardSideBar from '@/modules/dashboard/components/DashboardSideBar.vue'
import DashboardNews from '@/modules/dashboard/components/DashboardNews.vue'
import DashboardDetail from '@/modules/dashboard/components/DashboardDetail.vue'
//*===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊Methods

@Component({
  components: {
    DashboardSideBar,
    DashboardNews,
    DashboardDetail
  }
})
export default class Dashboard extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  //*===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏Computed
}
</script>

<template>
  <div class="wrap-dashboard">
    <DashboardSideBar />
    <div class="dash__board">
      <DashboardNews />
      <div class="dash__board--box">
        <DashboardDetail />
      </div>
    </div>
  </div>
</template>

<style lang="scss"></style>
