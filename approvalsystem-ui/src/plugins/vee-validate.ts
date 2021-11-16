import { extend, ValidationObserver, ValidationProvider } from 'vee-validate'
import { required } from 'vee-validate/dist/rules'
import Vue from 'vue'

// Add a rule.
extend('required', {
  ...required,
  message: 'Required'
})

extend('min_value', {
  validate(value, args) {
    return value >= args.length
  },
  message: (value, args) => {
    console.log(args)
    return `順位は${+args.length + 1}以降にしてください！`
  },
  params: ['length']
})

// Register it globally
Vue.component('ValidationObserver', ValidationObserver)
Vue.component('ValidationProvider', ValidationProvider)
