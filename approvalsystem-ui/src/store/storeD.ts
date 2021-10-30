import { State as AuthState } from '@/store/modules/auth/authD'
//*===📰===📰===📰===📰===📰===📰===📰===📰===📰===📰===📰===📰State

export interface State {
  auth: AuthState
}

//*===🌙===🌙===🌙===🌙===🌙===🌙===🌙===🌙===🌙===🌙===🌙===🌙Getters

const Getters = {}

//*===🔧===🔧===🔧===🔧===🔧===🔧===🔧===🔧===🔧===🔧===🔧===🔧Mutations

const Mutations = {}

//*===🤖===🤖===🤖===🤖===🤖===🤖===🤖===🤖===🤖===🤖===🤖===🤖Actions

const Actions = {
  initApp: 'initApp'
}

//*===💎===💎===💎===💎===💎===💎===💎===💎===💎===💎===💎===💎Decorators

const Decorators: {
  initApp: string
} = {
  initApp: Actions.initApp
}

//*===📰===📰===📰===📰===📰===📰===📰===📰===📰===📰===📰===📰Exports

export { Getters, Mutations, Actions, Decorators }
