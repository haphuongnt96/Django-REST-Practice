<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator'

//*===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷Primary

@Component({})
export default class RadioGroup extends Vue {
  //*===💧===💧===💧===💧===💧===💧===💧===💧===💧===💧===💧===💧Props
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  @Prop() items: any[]
  @Prop() value: number
  @Prop() itemText: string
  @Prop() itemValue: string
  @Prop({ default: 2 }) itemsPerRow: number
  //*===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏Computed
  get current() {
    return this.value
  }

  set current(value: number) {
    this.$emit('update:value', value)
    this.$emit('change', value)
  }
}
</script>

<template>
  <v-radio-group v-model="current" row dense hide-details class="pt-0 mt-0">
    <div class="grid" :style="`--template-column: ${itemsPerRow}`">
      <v-radio
        v-for="item in items"
        :key="item[itemValue]"
        :value="item[itemValue]"
        :label="item[itemText]"
      />
    </div>
  </v-radio-group>
</template>

<style lang="scss" scoped>
.grid {
  display: grid;
  grid-template-columns: repeat(var(--template-column), 1fr);
}
</style>
