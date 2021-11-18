// eslint-disable-next-line @typescript-eslint/no-unused-vars
declare namespace Vuetify {
  type VDataTable = {
    itemsPerPage: number
    page: number
  }

  type VForm = Vue & { validate: () => boolean; resetValidation: () => void }
}
