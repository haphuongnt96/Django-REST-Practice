import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import '@/plugins/server'
import '@/plugins/layout'
import '@/plugins/mixins'
import vuetify from '@/plugins/vuetify'

Vue.config.productionTip = false

new Vue({
  vuetify,
  router,
  store,
  render: (h) => h(App)
}).$mount('#app')

require('@/styles/main.scss')
