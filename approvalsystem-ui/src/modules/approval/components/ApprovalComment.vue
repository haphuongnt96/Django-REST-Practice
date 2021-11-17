<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator'
import { Getter as G } from 'vuex-class'
import { AuthD } from '@/store/typeD'
@Component({
  components: {}
})
export default class ApprovalComment extends Vue {
  @G(...AuthD.getUser) user: Auth.User
  //#region Prop
  @Prop() isOpen: boolean
  //#endregion

  //#region Data
  items = []
  snackbar = false
  //#endregion
  comment = ''

  async mounted() {
    // approval_route_idが取れない状態なので1で固定
    const [err, res] = await this.$api.approval.getApprovalRouteComment('1')
    if (!err && res) {
      this.items = res
    }
  }

  //#region COMPUTED
  get drawer() {
    return this.isOpen
  }

  set drawer(value: boolean) {
    this.$emit('update:isOpen', value)
  }

  get contents() {
    return this.$pageContents.APPROVAL
  }

  // 申請一覧のレコードクリック時に詳細画面に遷移する
  async saveComment(item) {
    // クリックされたオブジェクトのrequest_idを取得して渡す
    this.request_id = item.request_id
    const [err, res] = await this.$api.approval.postApprovalRouteComment('1', {
      request_id: 1, //TODO: 申請IDを取得する。
      approval_route_id: 1, //TODO: 承認ルートIDを取得する。
      ins_emp_id: this.user.id,
      comment_no: this.items[0].comment_no + 1,
      comment: this.comment
    })
    if (!err && res) {
      //emit data to ApprovalRoute for update approvalStatus
      // 参考中：ApprovalMainFunction
      // this.$emit('approval', res)
      this.$swal({
        title: 'コメントを登録しました。',
        icon: 'success',
        value: true
      })
      this.comment = ''
      const [err, res] = await this.$api.approval.getApprovalRouteComment('1')
      if (!err && res) {
        this.items = res
      }
    } else {
      this.$swal({
        title: 'コメント登録に失敗しました。',
        icon: 'error'
      })
    }
  }
  //#endregion
  //handle call child function
}
</script>

<template>
  <v-navigation-drawer width="400" app v-model="drawer" right>
    <div class="comment__container">
      <v-fab-transition>
        <v-btn color="grey" fab fixed right top x-small @click="drawer = false">
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </v-fab-transition>
      <div class="pa-5">
        <div class="text-h5 txt-text-1 mb-3">
          {{ contents.COMMENT_TITLE }}
        </div>
        <v-textarea
          class="mb-2"
          outlined
          hide-details="auto"
          dense
          v-model="comment"
          name="comment"
          value="コメントを入力してください。"
        ></v-textarea>
        <div class="d-flex">
          <v-spacer />
          <v-btn color="secondary" @click="saveComment">
            {{ contents.COMMENT_SAVE }}
          </v-btn>
        </div>
      </div>
      <perfect-scrollbar class="flex-grow-1 pa-5">
        <div class="mb-5" v-for="item in items" :key="item.comment_no">
          <div class="text-body-2 txt-text-3">
            {{ contents.COMMENT_NO_TITLE }}{{ item.approval_type_cd }}
          </div>
          <div class="text-body-2 txt-text-3">
            <span class="mr-2">{{ item.created | date('yyyy/MM/dd') }}</span>
            <!-- <span>{{ contents.COMMENT_REMAND }}</span> -->
            <span>{{ item.emp_nm }}</span>
          </div>
          <!-- <div class="text-body-1 txt-text-2 mb-2">
            <span class="mr-2">[{{ contents.COMMENT_APPROVER }}]</span>
            <span>{{ item.ins_emp_id }}</span>
          </div> -->
          <div class="text-body-2 txt-text-2">
            {{ item.comment }}
          </div>
        </div>
      </perfect-scrollbar>
    </div>
  </v-navigation-drawer>
</template>

<style lang="scss" scoped>
.comment__container {
  display: flex;
  flex-direction: column;
  max-height: 100vh;
}
</style>
