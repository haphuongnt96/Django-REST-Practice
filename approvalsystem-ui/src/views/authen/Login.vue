<script lang="ts">
import { AuthD } from '@/store/typeD'
import { Vue, Component } from 'vue-property-decorator'
import { Action as A } from 'vuex-class'

@Component({})
export default class Login extends Vue {
  @A(...AuthD.fetchCurrentUser) fetchCurrentUser: () => Auth.User
  //#region Data
  emp_cd = ''
  password = ''
  isEmError = false
  isPassError = false
  isValidation = false
  //#endregion

  async handleSubmit() {
    const [err, res] = await this.$api.authen.doLogin({
      emp_cd: this.emp_cd,
      password: this.password
    })
    if (!err && res) {
      this.fetchCurrentUser()
      localStorage.setItem('vue-token', res.access)
      localStorage.setItem('vue-token-reset', res.refresh)
      this.$router.push({ name: 'dashboard' })
    } else {
      this.$swal('社員IDもしくはパスワードが正しくありません')
    }
  }
  get contents() {
    return this.$pageContents.AUTHEN
  }
  validationRequire() {
    if (this.emp_cd.trim() !== '' && this.password.trim() !== '') {
      this.isValidation = true
    } else {
      this.isValidation = false
    }
  }
  onChangeEm() {
    this.validationRequire()
    if (this.emp_cd == '') {
      this.isEmError = true
    } else {
      this.isEmError = false
    }
  }
  onChangePass() {
    this.validationRequire()
    if (this.password == '') {
      this.isPassError = true
    } else {
      this.isPassError = false
    }
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
              v-bind:class="[isEmError ? 'error-form' : '']"
              required
              v-model="emp_cd"
              name="emp_cd"
              @change="onChangeEm()"
            />
            <span class="error-text" v-show="isEmError">
              {{ contents.BLANK_EMPLOYEEID }}
            </span>
          </div>
          <div class="login__board--form">
            <label for="">{{ contents.AU_PASSWORD }}</label>
            <input
              type="password"
              class="form-control"
              v-bind:class="[isPassError ? 'error-form' : '']"
              required
              v-model="password"
              name="password"
              @change="onChangePass()"
            />
            <span class="error-text" v-show="isPassError">
              {{ contents.BLANK_PASSWORD }}
            </span>
          </div>
          <div class="login__board--button">
            <button
              class="btn btn__full"
              v-bind:class="[isValidation ? '' : 'prevent-click']"
              type="submit"
            >
              <span>{{ contents.AU_BUTTON }}</span>
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<style lang="scss" scoped></style>
