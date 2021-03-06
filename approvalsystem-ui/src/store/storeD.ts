import { State as AuthState } from '@/store/modules/auth/authD'
//*===π°===π°===π°===π°===π°===π°===π°===π°===π°===π°===π°===π°State

export interface State {
  auth: AuthState
}

//*===π===π===π===π===π===π===π===π===π===π===π===πGetters

const Getters = {}

//*===π§===π§===π§===π§===π§===π§===π§===π§===π§===π§===π§===π§Mutations

const Mutations = {}

//*===π€===π€===π€===π€===π€===π€===π€===π€===π€===π€===π€===π€Actions

const Actions = {
  initApp: 'initApp'
}

//*===π===π===π===π===π===π===π===π===π===π===π===πDecorators

const Decorators: {
  initApp: string
} = {
  initApp: Actions.initApp
}

//*===π°===π°===π°===π°===π°===π°===π°===π°===π°===π°===π°===π°Exports

export { Getters, Mutations, Actions, Decorators }
