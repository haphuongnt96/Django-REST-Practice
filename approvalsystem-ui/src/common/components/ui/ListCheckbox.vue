<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator'

//*===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷Primary

@Component({})
export default class ListCheckbox extends Vue {
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
  <div class="grid">
    <v-checkbox
      v-for="item in items"
      :key="item.text"
      :label="item.text"
      hide-details="auto"
      dense
    />
  </div>
</template>

<style lang="scss" scoped>
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
}
</style>
