<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import { Getter as G } from 'vuex-class'
import { AuthD } from '@/store/typeD'

@Component({ components: {} })
export default class AppDefaultHeader extends Vue {
  @G(...AuthD.getUser) user: Auth.User
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  profiles = [{ title: 'パスワード変更', path: '/change-pass' }]

  //#region Computed
  get contents() {
    return this.$pageContents.APP_HEADER
  }
  //#endregion

  get loggedIn(): boolean {
    const loggedIn = localStorage.getItem('vue-token')
    return !!loggedIn
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
    <v-btn v-if="loggedIn" color="grey" class="mr-3" to="/dashboard">
      {{ contents.BACK }}
    </v-btn>
    <div v-if="loggedIn" class="txt-white mr-3">
      <v-menu offset-y>
        <template v-slot:activator="{ on, attrs }">
          <v-btn class="user__dropdown" v-bind="attrs" v-on="on">
            {{ user.emp_nm }}
            <v-icon class="cta">mdi-chevron-down</v-icon>
          </v-btn>
        </template>
        <v-list class="custom_menu_drop">
          <v-list-item>
            <v-list-item-title>
              <v-btn to="/change-pass">
                {{ 'パスワード変更' }}
              </v-btn>
            </v-list-item-title>
            <v-list-item-title>
              <v-btn @click="handleLogout()">
                {{ contents.LOGOUT }}
              </v-btn>
            </v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu>
    </div>
  </v-app-bar>
</template>

<style lang="scss" scoped></style>
