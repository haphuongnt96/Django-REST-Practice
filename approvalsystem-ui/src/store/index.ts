import Vue from 'vue'
import Vuex, { ActionTree } from 'vuex'
import { authStore } from '@/store/modules/auth/authStore'
import VuexPersistence from 'vuex-persist'
import { Actions, State } from './storeD'
import { Decorators as AuthDecorators } from '@/store/modules/auth/authD'

const vuexLocal = new VuexPersistence({
  storage: window.localStorage,
  reducer: (state: State) => ({
    auth: state.auth
  }),
  supportCircular: true
})

Vue.use(Vuex)

const actions: ActionTree<State, State> = {
  [Actions.initApp]({ dispatch }) {
    dispatch(AuthDecorators.fetchCurrentUserExt)
  }
}

export default new Vuex.Store({
  actions,
  plugins: [vuexLocal.plugin],
  modules: {
    auth: authStore
  }
})
