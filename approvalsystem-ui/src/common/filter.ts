import Vue from 'vue'
import format from 'date-fns/format'

Vue.filter(
  'date',
  function (value: string | Date, formatStr = 'dd/MM/yyyy', symbol = '') {
    try {
      return format(new Date(value), formatStr)
    } catch (err) {
      return symbol
    }
  }
)
