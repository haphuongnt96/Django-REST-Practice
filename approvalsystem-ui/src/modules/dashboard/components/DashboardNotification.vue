<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import { VTextMarquee } from 'vue-text-marquee'

@Component({
  components: {
    VTextMarquee
  }
})
export default class Notification extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  notifications: DashboardNotification.notifications[] = []
  //#region COMPUTED
  get contents() {
    return this.$pageContents.DASHBOARD
  }

  async created() {
    const [err, res] = await this.$api.dashboard.getDashuboardNotification()
    if (!err && res) {
      this.notifications = res
    }
  }
}
</script>

<template>
  <div class="approval__notification">
    <div class="float-left approval__notification_title">
      {{ contents.NOTIFICATION }}
    </div>
    <VTextMarquee :speed="40">
      {{ notifications[0].notification }}
      {{ notifications[1].notification }}
    </VTextMarquee>
  </div>
</template>

<style lang="scss" scoped></style>
