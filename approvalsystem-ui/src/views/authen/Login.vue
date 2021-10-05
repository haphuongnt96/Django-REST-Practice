<script lang="ts">
import { Vue, Watch } from 'vue-property-decorator'
export default class Login extends Vue {
  emp_cd = ''
  password = ''
  e_password = '1'
  async handleSubmit() {
    const [err, res] = await this.$api.authen.doLogin({
      emp_cd: this.emp_cd,
      password: this.password
    })
    if (!err && res) {
      localStorage.setItem('vue-token', res.data.access)
      localStorage.setItem('vue-token-reset', res.data.refresh)
      this.$router.push({ name: 'approval' })
    } else {
      this.$swal('社員IDもしくはパスワードが正しくありません')
    }
  }
  get contents() {
    return this.$pageContents.AUTHEN
  }
}
</script>

<template>
  <div id="login" class="login-page">
    <div class="login__board">
      <div class="login__board--wrap">
        <h4 class="login__board--title">{{ contents.AU_TITLE }}</h4>
        <form @submit.prevent="handleSubmit(this)">
          <div class="login__board--form">
            <label for="">{{ contents.AU_TITLE }}</label>
            <input
              type="text"
              class="form-control"
              required
              v-model="emp_cd"
              name="emp_cd"
              oninvalid="this.setCustomValidity('社員IDを入力してください')"
              oninput="this.setCustomValidity('')"
            />
          </div>
          <div class="login__board--form">
            <label for="">{{ contents.AU_PASSWORD }}</label>
            <input
              type="password"
              class="form-control"
              required
              v-model="password"
              name="password"
              oninvalid="this.setCustomValidity('パスワードを入力してください')"
              oninput="this.setCustomValidity('')"
            />
          </div>
          <div class="login__board--button">
            <button class="btn btn__full" type="submit">
              <span>{{ contents.AU_BUTTON }}</span>
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<style lang="scss" scoped></style>
