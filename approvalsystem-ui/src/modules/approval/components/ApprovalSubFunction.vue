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
          color="red"
          :content="commentCount"
          overlap
          :value="!!commentCount"
        >
          <v-btn
            width="80"
            :color="$config.Colors.blue1"
            :style="'border-radius:20px'"
            @click.stop="handleOpenComments"
          >
            {{ contents.COMMENT }}
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
