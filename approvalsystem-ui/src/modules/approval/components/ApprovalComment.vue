<script lang="ts">
import moment from 'moment'
import { Component, Prop, Vue } from 'vue-property-decorator'
@Component({
  components: {}
})
export default class ApprovalComment extends Vue {
  //#region Prop
  @Prop() isOpen: boolean
  //#endregion

  //#region Data
  items = [
    {
      index: '承認状況No.00001',
      createdAt: moment(),
      comment:
        'The Woodman set to work at once, and so sharp was his axe that the tree was soon chopped nearly through.'
    },
    {
      index: '承認状況No.00002',
      createdAt: moment(),
      comment:
        'The Woodman set to work at once, and so sharp was his axe that the tree was soon chopped nearly through.'
    },
    {
      index: '承認状況No.00003',
      createdAt: moment(),
      comment:
        'The Woodman set to work at once, and so sharp was his axe that the tree was soon chopped nearly through.'
    }
  ]
  snackbar = false
  //#endregion

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
  //#endregion
  //handle call child function
}
</script>

<template>
  <v-navigation-drawer width="400" app v-model="drawer" right>
    <div class="pa-5">
      <v-fab-transition>
        <v-btn color="grey" fab fixed right top x-small @click="drawer = false">
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </v-fab-transition>
      <div class="text-h5 txt-text-1 mb-3">
        {{ contents.COMMENT_TITLE }}
      </div>
      <v-textarea
        class="mb-2"
        outlined
        hide-details="auto"
        dense
        value="The Woodman set to work at once, and so sharp was his axe that the tree was soon chopped nearly through."
      ></v-textarea>
      <div class="d-flex mb-5">
        <v-spacer />
        <v-btn color="secondary">
          {{ contents.COMMENT_SAVE }}
        </v-btn>
      </div>
      <div class="mb-5" v-for="item in items" :key="item.index">
        <div class="text-h6 txt-dark mb-1">{{ item.index }}</div>
        <div class="text-body-2 txt-text-3">
          <span class="mr-2">{{ item.createdAt | date('yyyy/MM/dd') }}</span>
          <span>{{ contents.COMMENT_REMAND }}</span>
        </div>
        <div class="text-body-1 txt-text-2 mb-2">
          <span class="mr-2">[{{ contents.COMMENT_APPROVER }}]</span>
          <span>〇〇　✕✕</span>
        </div>
        <div class="text-body-2 txt-text-2">
          The Woodman set to work at once, and so sharp was his axe that the
          tree was soon chopped nearly through.The Woodman set to work at once,
          and so sharp was his axe that the tree was soon chopped nearly
          through. The Woodman set to work at once
        </div>
      </div>
    </div>
  </v-navigation-drawer>
</template>

<style lang="scss" scoped></style>
