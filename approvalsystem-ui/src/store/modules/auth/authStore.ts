import { Module } from 'vuex'
import { State } from './authD'
import { Mutations, Actions, Getters } from '@/store/modules/auth/authD'
import { State as StoreState } from '@/store/storeD'
import { getUserInfo } from '@/services/authen'

export const authStore: Module<State, StoreState> = {
  namespaced: true,
  state: {
    user: {} as Auth.User
  },
  getters: {
    [Getters.getUser](state): Auth.User {
      return state.user
    }
  },

  mutations: {
    [Mutations.setUser](state, payload) {
      state.user = payload
    }
  },

  actions: {
    async [Actions.fetchCurrentUser]({ commit }) {
      const [err, res] = await getUserInfo()
      if (!err && res) {
        commit(Mutations.setUser, res)
      }
    }
  }
}
