<script lang="ts">
// viewsディレクトリに格納したページはApp.vueを通して表示します。アプリケーション全体で使うナビゲーションはここで設定します。
// フラッシュスクリーンをインストールする
import FlashScreen from '@/common/components/ui/FlashScreen.vue'
// vue-property-decoratorを使うと、デコレータを使って書ける https://github.com/kaorun343/vue-property-decorator
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
      // route.meta route.meta.layout　どちらもTrueかまたは、defultLayoutに Layout を文字列結合して返す
      ((this.$route.meta && this.$route.meta.layout) || defaultLayout) +
      'Layout'
    )
  }

  mounted() {
    // ルーターが初期ナビゲーションを完了したときに呼び出されるコールバックをキューに入れます。
    // つまり、初期ルートに関連付けられているすべての非同期 enter フックと非同期コンポーネントを解決したことを意味します。
    // https://router.vuejs.org/ja/api/#router-onready
    this.$router.onReady(() => {
      this.loading = false
    })
  }
}
</script>

<template>
  <v-app :style="{ background: $config.Colors.pink1 }">
    <!-- loading中は、フラッシュスクリーンをそれ以外は、layoutを適用する-->
    <FlashScreen v-if="loading" />
    <component v-else :is="layout" />
  </v-app>
</template>

<style lang="scss">
html {
  color: #000;
}
</style>
