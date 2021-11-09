<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator'

//*===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷Primary

@Component({})
export default class RadioGroupCell extends Vue {
  //*===💧===💧===💧===💧===💧===💧===💧===💧===💧===💧===💧===💧Props
  @Prop() items: { text: string }[]
  @Prop() value: number
  @Prop({ default: 2 }) itemsPerRow: number
  //*===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏Computed
  get current() {
    return this.value
  }

  set current(value: number) {
    this.$emit('update:value', value)
  }
}
</script>

<template>
  <v-radio-group class="mt-0 pt-0" dense hide-details="auto">
    <div class="d-flex radio__item" v-for="item in items" :key="item.text">
      <div :style="{ 'min-width': '20%' }" class="py-3 px-8">
        <v-radio :label="item.text" />
      </div>
      <v-divider vertical />
      <div class="px-8 py-3 bg-grey-1 flex-grow-1">{{ item.description }}</div>
    </div>
  </v-radio-group>
</template>

<style lang="scss" scoped>
.radio__item {
  &:not(:last-child) {
    border-bottom: thin solid rgba(0, 0, 0, 0.12);
  }
}
</style>
