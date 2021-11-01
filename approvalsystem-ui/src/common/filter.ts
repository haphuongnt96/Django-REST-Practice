import Vue from 'vue'
import format from 'date-fns/format'

// vue.filterはすべてのページに適用される
// 値が文字列かDateなら、formatStrで変更を実施、出来なかったらsymbolの空で返す
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
