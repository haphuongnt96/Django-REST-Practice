<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator'
import ApprovalComment from '@/modules/approval/components/ApprovalComment.vue'

@Component({
  components: { ApprovalComment }
})
export default class ApprovalSubFunction extends Vue {
  //#region Prop
  @Prop() commentCount: number
  //#endregion

  //#region Data
  fab = false
  isOpen = false
  //#endregion

  //#region Computed
  get contents() {
    return this.$pageContents.APPROVAL
  }
  //#endregion

  //#region Methods
  handleOpenComments() {
    this.isOpen = true
    this.fab = false
  }
  //#endregion
}
</script>

<template>
  <div>
    <v-speed-dial
      v-model="fab"
      :bottom="true"
      fixed
      :right="true"
      :style="'margin-right:20px'"
      :direction="'top'"
      :transition="'slide-y-reverse-transition'"
    >
      <template v-slot:activator>
        <v-badge
          :color="$config.Colors.accent"
          :content="commentCount"
          overlap
          :value="!!commentCount"
        >
          <v-btn
            :color="$config.Colors.pink4"
            @click.stop="handleOpenComments"
            dark
            fab
          >
            <!-- <v-icon>mdi-chat-processing-outline</v-icon> -->
            <v-icon>mdi-message-processing-outline</v-icon>
          </v-btn>
        </v-badge>
      </template>
    </v-speed-dial>
    <ApprovalComment :isOpen.sync="isOpen" />
  </div>
</template>

<style lang="scss" scoped>
::v-deep {
  .v-speed-dial__list {
    width: 200px !important;
    left: -160px !important;
  }
}
.v-btn--floating {
  position: relative;
}

.v-btn {
  color: $white;
}
</style>
