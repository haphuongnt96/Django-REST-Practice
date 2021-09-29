<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'

@Component({ components: {} })
export default class AppDefaultHeader extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data

  get contents() {
    return this.$pageContents.APP_HEADER
  }
  async handleLogout() {
    const [err, res] = await this.$api.authen.doLogout()
    if (!err && res) {
      this.$router.push({ name: 'authen' })
      localStorage.removeItem('vue-token')
      localStorage.removeItem('vue-token-reset')
    } else {
      alert('logout fail')
    }
  }
}
</script>

<template>
  <v-app-bar app fixed dense color="#93B5C6">
    <div class="text-h6 txt-white">{{ contents.title }}</div>
    <v-spacer />
    <v-btn small color="grey" class="mr-3" to="/dashboard">
      {{ contents.BACK }}
    </v-btn>
    <div class="txt-white mr-3">{{ contents.USER_LOGIN }}</div>
    <v-btn small color="grey" @click="handleLogout()">
      {{ contents.LOGOUT }}
    </v-btn>
  </v-app-bar>
</template>

<style lang="scss" scoped></style>
