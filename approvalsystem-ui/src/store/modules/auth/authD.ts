type Decorator = [string, { namespace: string }]

// Namespace and scope helpers
export const namespace = 'auth' // ! Important to set correctly
const scope = { namespace }

export interface State {
  user: Auth.User
}

const Getters = {
  getUser: 'getUser'
}

const Mutations = {
  setUser: 'setUser'
}

const Actions = {
  fetchCurrentUser: 'fetchCurrentUser'
}

const Decorators: {
  getUser: Decorator
  setUser: Decorator
  fetchCurrentUser: Decorator
  fetchCurrentUserExt: string
} = {
  getUser: [Getters.getUser, scope],
  setUser: [Mutations.setUser, scope],
  fetchCurrentUser: [Actions.fetchCurrentUser, scope],
  fetchCurrentUserExt: namespace + '/' + Actions.fetchCurrentUser
}

export { Getters, Mutations, Actions, Decorators }
