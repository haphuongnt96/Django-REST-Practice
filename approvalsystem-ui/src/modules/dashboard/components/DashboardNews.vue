<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import { VTextMarquee } from 'vue-text-marquee'

@Component({
  components: {
    VTextMarquee
  }
})
export default class News extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  news: Dashboard.DashboardNews[] = []
  //#region COMPUTED
  get contents() {
    return this.$pageContents.DASHBOARD
  }

  async created() {
    const [err, res] = await this.$api.dashboard.getDashuboardNews()
    if (!err && res) {
      this.news = res
      console.log(this.news)
    }
  }
}
</script>

<template>
  <div class="approval__notification">
    <div class="float-left approval__notification_title">
      {{ contents.NEWS }}
    </div>
    <VTextMarquee :speed="40">
      {{ news[0].news }}
      {{ news[1].news }}
    </VTextMarquee>
  </div>
</template>

<style lang="scss" scoped></style>
