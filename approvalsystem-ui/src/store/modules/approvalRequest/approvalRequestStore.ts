import {
  Getters,
  Mutations
} from '@/store/modules/approvalRequest/approvalRequestD'
import { State as StoreState } from '@/store/storeD'
import { Module } from 'vuex'
import { State } from './approvalRequestD'

export const approvalRequestStore: Module<State, StoreState> = {
  namespaced: true,
  state: {
    listApprovers: [],
    listNotifies: []
  },
  getters: {
    [Getters.getListApprovers](state): Approvals.ApprovalRouteDetailResponse[] {
      return state.listApprovers
    },

    [Getters.getListNotifies](state): Approvals.NotificationRecords[] {
      return state.listNotifies
    }
  },

  mutations: {
    [Mutations.setListApprovers](state, payload) {
      state.listApprovers = payload
    },

    [Mutations.setListNotifies](state, payload) {
      state.listNotifies = payload
    }
  },

  actions: {}
}
