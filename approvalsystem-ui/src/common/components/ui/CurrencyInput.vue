<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator'

//*===🎯===🎯===🎯===🎯===🎯===🎯===🎯===🎯===🎯===🎯===🎯===🎯Main

@Component({
  components: {}
})
export default class CurrencyInput extends Vue {
  //*===👜===👜===👜===👜===👜===👜===👜===👜===👜===👜===👜===👜Props

  @Prop() value: string
  @Prop({ default: true }) dense: boolean
  @Prop({ default: 'auto' }) hideDetails: boolean
  @Prop({ default: false }) allowNegativeNumber: boolean
  @Prop() label: string
  @Prop({ default: false }) loading: string
  @Prop() disabled: string
  @Prop() title: string
  @Prop({ default: false }) persistent: boolean
  @Prop({ default: true }) outlined: boolean
  @Prop({ default: 255 }) maxLength: number
  @Prop() min: number
  @Prop({ default: false }) readonly: boolean
  @Prop() rules: string

  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data

  get distractionFree() {
    return {
      hideNegligibleDecimalDigits: true,
      hideCurrencySymbol: false,
      hideGroupingSymbol: false
    }
  }
  get format() {
    return {
      locale: 'en',
      currency: null,
      distractionFree: this.distractionFree,
      precision: { min: 0, max: 2 },
      allowNegative: this.allowNegativeNumber
    }
  }

  get valueLocal() {
    return this.value
  }

  set valueLocal(value: string) {
    this.$emit('input', value)
  }

  get formatValue() {
    const formatter = new Intl.NumberFormat('en-US', {
      minimumFractionDigits: 0
    })
    return this.value === '' ? '' : formatter.format(+this.value)
  }

  //*===👀===👀===👀===👀===👀===👀===👀===👀===👀===👀===👀===👀Watchers

  //*===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊Methods

  //* Process data and emit so parent can save

  watchE(e: KeyboardEvent) {
    if (e.key === '-' && !this.allowNegativeNumber) {
      e.preventDefault()
    }
  }

  onInput(value: string) {
    this.valueLocal = value.toString().replace(/\$\s?|(,*)/g, '')
  }
}
</script>

<template>
  <ValidationProvider :rules="rules" v-slot="{ errors }">
    <v-text-field
      v-currency="format"
      :value="formatValue"
      :error-messages="errors[0]"
      :title="title || label"
      :label="label"
      :loading="loading"
      :dense="dense"
      :hide-details="hideDetails"
      :disabled="disabled || loading"
      :outlined="outlined"
      :readonly="readonly"
      :min="min"
      :maxlength="19"
      @input="onInput"
      @keydown.native="watchE"
    ></v-text-field>
  </ValidationProvider>
</template>
