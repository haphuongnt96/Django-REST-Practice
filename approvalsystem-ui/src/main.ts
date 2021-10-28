import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import '@/plugins'
import '@/common/filter'
import vuetify from '@/plugins/vuetify'
import VueSweetalert2 from 'vue-sweetalert2'
import 'sweetalert2/dist/sweetalert2.min.css'
import { Decorators } from '@/store/storeD'

Vue.config.productionTip = false

new Vue({
  vuetify,
  router,
  store,
  render: (h) => h(App),
  created() {
    store.dispatch(Decorators.initApp, null, { root: true })
  }
}).$mount('#app')
Vue.use(VueSweetalert2)
require('@/styles/main.scss')
