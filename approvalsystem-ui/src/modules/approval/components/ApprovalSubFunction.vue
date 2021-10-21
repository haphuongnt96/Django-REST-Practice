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
      :direction="'top'"
      :transition="'slide-y-reverse-transition'"
    >
      <template v-slot:activator>
        <v-badge
          color="red"
          :content="commentCount"
          overlap
          :value="!!commentCount"
        >
          <v-btn v-model="fab" color="primary darken-2" dark fab>
            <v-icon v-if="fab">mdi-close</v-icon>
            <span v-else class="text-h5">他</span>
          </v-btn>
        </v-badge>
      </template>
      <v-card class="d-flex flex-column align-left flex-gap-2 pa-5">
        <div class="d-flex align-center flex-gap-1">
          <v-badge
            color="red"
            :content="commentCount"
            overlap
            :value="!!commentCount"
          >
            <v-btn
              width="120"
              :color="$config.Colors.blue1"
              @click.stop="handleOpenComments"
            >
              コメント
            </v-btn>
          </v-badge>
        </div>
        <!-- <v-btn width="120" :color="$config.Colors.red1">
          {{ contents.APPROVER }}
        </v-btn>
        <v-btn width="120" :color="$config.Colors.red1">
          {{ contents.ANNOUNT_PERSON }}
        </v-btn> -->
        <v-btn width="120" :color="$config.Colors.red1">
          {{ contents.COPY_FUNCTION }}
        </v-btn>
      </v-card>
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
