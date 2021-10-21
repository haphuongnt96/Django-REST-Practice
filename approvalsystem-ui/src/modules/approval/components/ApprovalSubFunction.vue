<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import ApprovalComment from '@/modules/approval/components/ApprovalComment.vue'

@Component({
  components: { ApprovalComment }
})
export default class ApprovalSubFunction extends Vue {
  fab = false
  isOpen = false

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
        <v-btn v-model="fab" color="blue darken-2" dark fab>
          <v-icon v-if="fab">mdi-close</v-icon>
          <v-icon v-else>mdi-message</v-icon>
        </v-btn>
      </template>
      <v-card class="d-flex flex-column align-left flex-gap-2 pa-5">
        <div class="d-flex align-center flex-gap-1">
          <v-btn
            width="120"
            :color="$config.Colors.blue1"
            @click.stop="handleOpenComments"
          >
            コメント
          </v-btn>
          <div class="comment__status">有</div>
        </div>
        <v-btn width="120" :color="$config.Colors.red1">
          {{ contents.APPROVER }}
        </v-btn>
        <v-btn width="120" :color="$config.Colors.red1">
          {{ contents.ANNOUNT_PERSON }}
        </v-btn>
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
    width: 200px;
    left: -160px;
  }
}
.v-btn--floating {
  position: relative;
}

.v-btn {
  color: $white;
}

.comment__status {
  border: solid thin $pink-2;
  padding: 0 12px;
  color: white;
  background: $pink-2;
}
</style>
