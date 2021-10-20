<script lang="ts">
import FlashScreen from '@/common/components/ui/FlashScreen.vue'
import { Component, Vue } from 'vue-property-decorator'

//*===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊Methods

@Component({
  components: { FlashScreen }
})
export default class App extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  loading = true
  //*===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏Computed

  get layout() {
    const defaultLayout = 'AppDefault'
    return (
      ((this.$route.meta && this.$route.meta.layout) || defaultLayout) +
      'Layout'
    )
  }

  mounted() {
    this.$router.onReady(() => {
      this.loading = false
    })
  }
}
</script>

<template>
  <v-app :style="{ background: $config.Colors.pink1 }">
    <FlashScreen v-if="loading" />
    <component v-else :is="layout" />
  </v-app>
</template>

<style lang="scss">
html {
  color: #000;
}
</style>
