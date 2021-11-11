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
    }
  }
}
</script>

<template>
  <div class="approval__news">
    <div class="float-left approval__news_title">
      {{ contents.NEWS }}
    </div>
    <VTextMarquee :speed="40">
      <span v-for="issue in news" :key="issue.news_id">{{ issue.news }}</span>
    </VTextMarquee>
  </div>
</template>

<style lang="scss" scoped></style>
