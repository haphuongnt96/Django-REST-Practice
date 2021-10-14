<script lang="ts">
import { Vue, Component } from 'vue-property-decorator'
@Component({})
export default class ChangePass extends Vue {
  oldPassword = ''
  newPassword = ''
  confirmPassword = ''
  isOPError = false
  isNPError = false
  isCPError = false
  isValidation = false
  ConfirmPassMess = ''
  //formがsubmitされたときに実行される関数 async非同期処理
  async handleSubmit() {
    //await でPromiseの結果がかえってくるまで処理を停止
    const [err, res] = await this.$api.authen.doChangePass({
      oldPassword: this.oldPassword,
      newPassword: this.newPassword,
      confirmPassword: this.confirmPassword
    })
    //エラーがないときの処理
    if (!err && res) {
      this.$swal({
        title: '成功',
        text: res.message,
        icon: 'success'
      })
      this.$router.push({ name: 'approval' })
    } else {
      //swalはアラート用のライブラリ。バックエンド側でエラーが発生したときのメッセージ
      this.$swal({
        title: 'エラー',
        text: err.response.data.message,
        icon: 'error'
      })
    }
  }
  get contents() {
    return this.$pageContents.AUTHEN
  }
  validationRequire() {
    if (
      this.oldPassword.trim() !== '' &&
      this.newPassword.trim() !== '' &&
      this.confirmPassword.trim() !== '' &&
      !this.isNPError &&
      !this.isCPError
    ) {
      this.isValidation = true
    } else {
      this.isValidation = false
    }
  }
  onChangePass() {
    if (this.oldPassword == '') {
      this.isOPError = true
    } else {
      this.isOPError = false
    }
    this.validationRequire()
  }
  onChangeNewPass() {
    if (this.newPassword == '') {
      this.isNPError = true
    }
    //regex validation for pass rule
    var regexPass = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$/
    let result = this.newPassword.match(regexPass)
    if (result) {
      this.isNPError = false
    } else {
      this.isNPError = true
    }
    this.validationRequire()
  }
  onChangeConfirmPass() {
    if (this.confirmPassword == '') {
      this.isCPError = true
      this.ConfirmPassMess = this.$pageContents.AUTHEN.BLANK_PASSWORD
    } else {
      if (this.confirmPassword !== this.newPassword) {
        this.isCPError = true
        this.ConfirmPassMess =
          '「新しいパスワード」及び「新しいパスワード（確認）」には同じ内容を入力してください'
      } else {
        this.isCPError = false
      }
    }
    this.validationRequire()
  }
}
</script>

<template>
  <div id="login" class="login-page">
    <div class="login__board">
      <div class="login__board--wrap">
        <h4 class="login__board--title">{{ contents.CHANGE_PASS_TITLE }}</h4>
        <form @submit.prevent="handleSubmit(this)">
          <div class="login__board--form">
            <label for="">{{ contents.CHANGE_PASS_OLDPASS }}</label>
            <input
              type="password"
              class="form-control"
              v-bind:class="[isOPError ? 'error-form' : '']"
              required
              v-model="oldPassword"
              name="oldPassword"
              @change="onChangePass()"
            />
            <span class="error-text" v-show="isOPError">
              {{ contents.BLANK_PASSWORD }}
            </span>
          </div>
          <div class="login__board--form">
            <label for="">{{ contents.CHANGE_PASS_NEWPASS }}</label>
            <input
              type="password"
              class="form-control"
              v-bind:class="[isNPError ? 'error-form' : '']"
              required
              v-model="newPassword"
              name="newPassword"
              @change="onChangeNewPass()"
            />
            <div class="error-text" v-show="isNPError">
              {{ contents.CHANGE_PASS_NEWPASS_ERR }}
              <span class="error-tip">
                <v-icon class="cta">mdi-alert</v-icon>
              </span>
              <v-tooltip right content-class="custom__tooltip">
                <template v-slot:activator="{ on, attrs }">
                  <span class="error-tip">
                    <v-icon class="cta" v-bind="attrs" v-on="on">
                      mdi-alert
                    </v-icon>
                  </span>
                </template>
                <div class="error-text">
                  <span>パスワードポリシーは、以下とする。</span>
                  <ul class="error__list">
                    <li>
                      <v-icon class="cta">mdi-close</v-icon>
                      「英小文字」を１文字以上必要
                    </li>
                    <li>
                      <v-icon class="cta">mdi-close</v-icon>
                      「英大文字」を１文字以上必要
                    </li>
                    <li>
                      <v-icon class="cta">mdi-close</v-icon>
                      「数字」を１文字以上必要
                    </li>
                    <li>
                      <v-icon class="cta">mdi-close</v-icon>
                      <span>
                        使用可能記号：!?"#$%&amp;*()+-=^~@`[]{}&lt;&gt;;:,./|_
                      </span>
                    </li>
                    <li>
                      <v-icon class="cta">mdi-close</v-icon>
                      最小文字数：8
                    </li>
                    <li>
                      <v-icon class="cta">mdi-close</v-icon>
                      最大文字数：30
                    </li>
                  </ul>
                </div>
              </v-tooltip>
            </div>
          </div>
          <div class="login__board--form">
            <label for="">{{ contents.CHANGE_PASS_CONFIRMPASS }}</label>
            <input
              type="password"
              class="form-control"
              v-bind:class="[isCPError ? 'error-form' : '']"
              required
              v-model="confirmPassword"
              name="confirmPassword"
              @change="onChangeConfirmPass()"
            />
            <span class="error-text" v-show="isCPError">
              {{ ConfirmPassMess }}
            </span>
          </div>
          <div class="login__board--button">
            <button
              class="btn btn__full"
              v-bind:class="[isValidation ? '' : 'prevent-click']"
              type="submit"
            >
              <span>{{ contents.CHANGE_PASS_BUTTON }}</span>
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<style lang="scss" scoped></style>
