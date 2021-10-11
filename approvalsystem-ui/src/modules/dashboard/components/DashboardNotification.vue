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
  //#region COMPUTED
  get contents() {
    return this.$pageContents.DASHBOARD
  }
  //#endregion
}
</script>

<template>
  <div class="approval__notification">
    <VTextMarquee :speed="40">
      *2022 年4月1日12時から13時までメンテナンス作行のため、利用できません。*
    </VTextMarquee>
  </div>
</template>

<style lang="scss" scoped></style>
