<script lang="ts">
import { Component, Prop, Vue, Watch } from 'vue-property-decorator'
// eslint-disable-next-line @typescript-eslint/no-var-requires
const debounce = require('lodash.debounce')

//*===🎯===🎯===🎯===🎯===🎯===🎯===🎯===🎯===🎯===🎯===🎯===🎯Main

@Component({
  components: {}
})
export default class CurrencyInput extends Vue {
  //*===👜===👜===👜===👜===👜===👜===👜===👜===👜===👜===👜===👜Props

  @Prop() value: string | string | null
  @Prop({ default: true }) dense: boolean
  @Prop({ default: 'auto' }) hideDetails: boolean
  @Prop({ default: false }) allowNegativeNumber: boolean
  @Prop() errorMessages: string
  @Prop() label: string
  @Prop({ default: false }) loading: string
  @Prop() disabled: string
  @Prop() title: string
  @Prop({ default: false }) persistent: boolean
  @Prop({ default: true }) outlined: boolean
  @Prop({ default: 255 }) maxLength: number
  @Prop() min: number
  @Prop({ default: false }) readonly: boolean

  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  deboundSave = debounce(this.onSave, 1000)
  emits = { onSave: 'onSave', onBlur: 'onBlur' }
  isUpdated = false
  floatValue: number | string | null = null
  formatValue: number | string | null = null

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

  set valueLocal(value: string | number | null) {
    if (!value && value !== 0) return
    const formatter = new Intl.NumberFormat('en-US', {
      minimumFractionDigits: 0
    })
    const newValue = value.toString().replace(/\$\s?|(,*)/g, '')
    if (isNaN(+newValue)) return
    this.floatValue = +newValue
    this.formatValue =
      formatter.format(this.floatValue) === '0'
        ? 0
        : formatter.format(this.floatValue)
  }

  //*===👀===👀===👀===👀===👀===👀===👀===👀===👀===👀===👀===👀Watchers
  @Watch('value', { immediate: true }) onValueUpdate() {
    this.valueLocal = this.value
  }

  //*===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊Methods

  //* Process data and emit so parent can save
  onSave() {
    this.isUpdated = true
    this.$emit('input', this.floatValue)
  }

  onBlur() {
    if (this.isUpdated) {
      this.$emit(this.emits.onBlur, this.floatValue)
      this.isUpdated = false
    }
  }

  watchE(e: KeyboardEvent) {
    if (e.key === '-' && !this.allowNegativeNumber) {
      e.preventDefault()
    }
  }

  onInput(value: string) {
    this.valueLocal = value
    this.deboundSave()
  }
}
</script>

<template>
  <v-text-field
    v-currency="format"
    :value="formatValue"
    :error-messages="errorMessages"
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
    @blur="onBlur"
  ></v-text-field>
</template>
