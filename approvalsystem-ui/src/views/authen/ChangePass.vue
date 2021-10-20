<script lang="ts">
import { Vue, Component } from 'vue-property-decorator'
@Component({})
export default class ChangePass extends Vue {
  oldPassword = ''
  newPassword = ''
  confirmPassword = ''
  isOldPassError = false
  isNewPassError = false
  isConfirmPassError = false
  isValidation = false
  confirmPassMsg = ''
  //formがsubmitされたときに実行される関数 async非同期処理
  async handleSubmit() {
    //await でPromiseの結果がかえってくるまで処理を停止
    const [err, res] = await this.$api.authen.doChangePass({
      oldPassword: this.oldPassword,
      newPassword: this.newPassword,
      confirmPassword: this.confirmPassword
    })
    if (!err && res) {
      //正常処理　swalはアラート用のライブラリ
      this.$swal({
        title: '成功',
        text: res.message,
        icon: 'success',
        value: true
      }).then((result) => {
        if (result) {
          this.$router.push({ name: 'dashboard' })
        }
      })
    } else {
      //バックエンド側でエラーが発生したときのメッセージ
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
      //各入力項目に未入力がなくエラーがないならtrue
      this.oldPassword.trim() !== '' &&
      this.newPassword.trim() !== '' &&
      this.confirmPassword.trim() !== '' &&
      !this.isNewPassError &&
      !this.isConfirmPassError
    ) {
      this.isValidation = true
    } else {
      this.isValidation = false
    }
  }
  onChangePass() {
    if (this.oldPassword == '') {
      this.isOldPassError = true
    } else {
      this.isOldPassError = false
    }
    this.validationRequire()
  }
  onChangeNewPass() {
    if (this.newPassword == '') {
      this.isNewPassError = true
    }
    //regex validation for pass rule
    // チェック希望記号：!?@#$%~&*,.+-_=
    let low_up_num = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}$/
    let low_up_sym = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!?@#$%~&*,.+_=\-]).{8,30}$/
    let up_num_sym = /^(?=.*\d)(?=.*[A-Z])(?=.*[!?@#$%~&*,.+_=\-]).{8,30}$/
    let low_num_sym = /^(?=.*\d)(?=.*[a-z])(?=.*[!?@#$%~&*,.+_=\-]).{8,30}$/
    //正規表現チェック
    let result_low_up_num = low_up_num.test(this.newPassword)
    let result_low_up_sym = low_up_sym.test(this.newPassword)
    let result_up_num_sym = up_num_sym.test(this.newPassword)
    let result_low_num_sym = low_num_sym.test(this.newPassword)
    //結果判定
    if (
      result_low_up_num ||
      result_low_up_sym ||
      result_up_num_sym ||
      result_low_num_sym
    ) {
      this.isNewPassError = false
    } else {
      this.isNewPassError = true
    }
    this.validationRequire()
  }
  onChangeConfirmPass() {
    if (this.confirmPassword == '') {
      //未入力チェック
      this.isConfirmPassError = true
      this.confirmPassMsg = this.$pageContents.AUTHEN.BLANK_PASSWORD
    } else {
      if (this.confirmPassword !== this.newPassword) {
        //新しいパスワードと確認用パスワードの一致チェック
        this.isConfirmPassError = true
        this.confirmPassMsg = this.$pageContents.AUTHEN.NOT_SAME_PASSWORD
      } else {
        if (this.confirmPassword == this.oldPassword) {
          //現在のパスワードと確認用パスワードと変更されているかチェック
          this.isConfirmPassError = true
          this.confirmPassMsg = this.$pageContents.AUTHEN.NOT_CHANGE_PASS
        } else {
          this.isConfirmPassError = false
        }
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
        <form @keydown.enter.prevent @submit.prevent="handleSubmit(this)">
          <div class="login__board--form">
            <label for="">{{ contents.CHANGE_PASS_OLDPASS }}</label>
            <input
              type="password"
              class="form-control"
              v-bind:class="[isOldPassError ? 'error-form' : '']"
              required
              v-model="oldPassword"
              name="oldPassword"
              @change="onChangePass()"
            />
            <span class="error-text" v-show="isOldPassError">
              {{ contents.BLANK_PASSWORD }}
            </span>
          </div>
          <div class="login__board--form">
            <label for="">{{ contents.CHANGE_PASS_NEWPASS }}</label>
            <input
              type="password"
              class="form-control"
              v-bind:class="[isNewPassError ? 'error-form' : '']"
              required
              v-model="newPassword"
              name="newPassword"
              @input="onChangeNewPass()"
            />
            <div class="error-text" v-show="isNewPassError">
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
                      「英小文字」「英大文字」「数字」「記号」の中で3種類上、8文字以上30文字以内で入力してください
                    </li>
                    <li>
                      <v-icon class="cta">mdi-close</v-icon>
                      <span>使用可能記号：!?@#$%~&*,.+-_=</span>
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
              v-bind:class="[isConfirmPassError ? 'error-form' : '']"
              required
              v-model="confirmPassword"
              name="confirmPassword"
              @input="onChangeConfirmPass()"
            />
            <span class="error-text" v-show="isConfirmPassError">
              {{ confirmPassMsg }}
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
