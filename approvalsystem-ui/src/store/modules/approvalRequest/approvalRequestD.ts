type Decorator = [string, { namespace: string }]

// Namespace and scope helpers
export const namespace = 'approvalRequest' // ! Important to set correctly
const scope = { namespace }

export interface State {
  listApprovers: Approvals.RegisterApprovalRouteDetail[]
  listNotifies: Approvals.NotificationRecords[]
}

const Getters = {
  getListApprovers: 'getListApprovers',
  getListNotifies: 'getListNotifies'
}

const Mutations = {
  setListApprovers: 'setListApprovers',
  setListNotifies: 'setListNotifies'
}

const Actions = {
  fetchCurrentUser: 'fetchCurrentUser'
}

const Decorators: {
  getListApprovers: Decorator
  getListNotifies: Decorator
  setListApprovers: Decorator
  setListNotifies: Decorator
} = {
  getListApprovers: [Getters.getListApprovers, scope],
  getListNotifies: [Getters.getListNotifies, scope],
  setListApprovers: [Mutations.setListApprovers, scope],
  setListNotifies: [Mutations.setListNotifies, scope]
}

export { Getters, Mutations, Actions, Decorators }
