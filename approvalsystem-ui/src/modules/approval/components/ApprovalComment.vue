<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
@Component({
  components: {}
})
export default class ApprovalComment extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  //#region COMPUTED
  snackbar = false
  selectStatus = [
    { state: 'Florida', abbr: 'FL' },
    { state: 'Georgia', abbr: 'GA' },
    { state: 'Nebraska', abbr: 'NE' },
    { state: 'California', abbr: 'CA' },
    { state: 'New York', abbr: 'NY' }
  ]
  get contents() {
    return this.$pageContents.APPROVAL
  }
  //#endregion
  //handle call child function
}
</script>

<template>
  <div class="text-center">
    <v-btn
      class="color-white"
      @click="snackbar = true"
      width="120"
      :color="$config.Colors.blue1"
    >
      コメント
    </v-btn>
    <v-snackbar
      v-model="snackbar"
      class="comment__dialog"
      timeout="-1"
      right="true"
      top="true"
      light="true"
    >
      <div class="comment__box">
        <h4 class="comment__box--title">
          {{ contents.COMMENT_TITLE }}
        </h4>
        <v-textarea
          no-resize="true"
          filled
          name="input-7-4"
          hide-details="auto"
          dense
          value="The Woodman set to work at once, and so sharp was his axe that the tree was soon chopped nearly through."
        ></v-textarea>
        <br />
        <div class="text-right">
          <v-btn color="grey">
            {{ contents.COMMENT_SAVE }}
          </v-btn>
        </div>
        <br />
        <v-select
          :items="selectStatus"
          label="承認状況No.00001"
          item-text="state"
          item-value="abbr"
          dense
          outlined
          hide-details="auto"
        />
        <div class="comment__box--items">
          <div class="box__items--top">
            <ul>
              <li>
                <div class="items__top--date">
                  <span>yyyy/mm/dd</span>
                  <b>{{ contents.COMMENT_REMAND }}</b>
                </div>
              </li>
              <li>
                <div class="items__top--author">
                  <b>[{{ contents.COMMENT_APPROVER }}]</b>
                  <span>〇〇　✕✕</span>
                </div>
              </li>
            </ul>
          </div>
          <div class="box__items--body">
            <v-textarea
              filled
              disabled
              no-resize="true"
              name="input-7-4"
              value="The Woodman set to work at once, and so sharp was his axe that the tree was soon chopped nearly through."
            ></v-textarea>
          </div>
        </div>
        <div class="comment__box--items">
          <div class="box__items--top">
            <ul>
              <li>
                <div class="items__top--date">
                  <span>yyyy/mm/dd</span>
                  <b>{{ contents.COMMENT_REMAND }}</b>
                </div>
              </li>
              <li>
                <div class="items__top--author">
                  <b>[{{ contents.COMMENT_APPROVER }}]</b>
                  <span>〇〇　✕✕</span>
                </div>
              </li>
            </ul>
          </div>
          <div class="box__items--body">
            <v-textarea
              filled
              disabled
              no-resize="true"
              name="input-7-4"
              value="The Woodman set to work at once, and so sharp was his axe that the tree was soon chopped nearly through."
            ></v-textarea>
          </div>
        </div>
        <div class="comment__box--items">
          <div class="box__items--top">
            <ul>
              <li>
                <div class="items__top--date">
                  <span>yyyy/mm/dd</span>
                  <b>{{ contents.COMMENT_REMAND }}</b>
                </div>
              </li>
              <li>
                <div class="items__top--author">
                  <b>[{{ contents.COMMENT_APPROVER }}]</b>
                  <span>〇〇　✕✕</span>
                </div>
              </li>
            </ul>
          </div>
          <div class="box__items--body">
            <v-textarea
              filled
              disabled
              no-resize="true"
              name="input-7-4"
              value="The Woodman set to work at once, and so sharp was his axe that the tree was soon chopped nearly through."
            ></v-textarea>
          </div>
        </div>
        <div class="comment__box--items">
          <div class="box__items--top">
            <ul>
              <li>
                <div class="items__top--date">
                  <span>yyyy/mm/dd</span>
                  <b>{{ contents.COMMENT_REMAND }}</b>
                </div>
              </li>
              <li>
                <div class="items__top--author">
                  <b>[{{ contents.COMMENT_APPROVER }}]</b>
                  <span>〇〇　✕✕</span>
                </div>
              </li>
            </ul>
          </div>
          <div class="box__items--body">
            <v-textarea
              filled
              disabled
              no-resize="true"
              name="input-7-4"
              value="The Woodman set to work at once, and so sharp was his axe that the tree was soon chopped nearly through."
            ></v-textarea>
          </div>
        </div>
      </div>

      <div class="text-left close-btn">
        <v-btn v-bind="attrs" @click="snackbar = false">X</v-btn>
      </div>
    </v-snackbar>
  </div>
</template>

<style lang="scss" scoped></style>
