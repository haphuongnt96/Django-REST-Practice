<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator'

//*===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷===🔷Primary
enum HideDetails {
  AUTO = 'auto'
}

@Component({})
export default class AppTextField extends Vue {
  //*===💧===💧===💧===💧===💧===💧===💧===💧===💧===💧===💧===💧Props
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  @Prop({ default: HideDetails.AUTO }) hideDetails: HideDetails
  @Prop({ default: true }) dense: boolean
  @Prop() value: string
  @Prop({ default: false }) disabled: boolean
  @Prop({ default: true }) outlined: boolean
  @Prop() validations: string
  //*===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏Computed
  get current() {
    return this.value
  }

  set current(value: string) {
    this.$emit('input', value)
  }

  //#region Method
  handleChange(value: string) {
    this.$emit('change', value)
  }
  //#endregion
}
</script>

<template>
  <ValidationProvider :rules="validations" v-slot="{ errors }">
    <v-text-field
      :hide-details="hideDetails"
      :dense="dense"
      :outlined="outlined"
      :disabled="disabled"
      v-model="current"
      :error-messages="errors[0]"
      @change="handleChange"
    />
  </ValidationProvider>
</template>

<style lang="scss" scoped></style>
