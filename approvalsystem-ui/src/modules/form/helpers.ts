import config from '@/common/config'
import RadioGroup from '@/common/components/ui/RadioGroup.vue'
import { VSelect, VTextField } from 'vuetify/lib'
// eslint-disable-next-line @typescript-eslint/no-var-requires
const groupBy = require('lodash.groupby')

type TableCell = {
  text?: string
  rowspan?: number
  colspan?: number
  key?: string
  value?: string
  rowIndex?: number
  cellIndex?: number
  rowName?: string
  options?: { text: string }[]
  children?: TableCell[]
}

type TableItem = TableCell & {
  children?: TableCell[]
}

export const rowIndexStatus = (
  index: number,
  name: string,
  status: string,
  fixed = false
) => {
  return [
    {
      text: `<span class="index--circle">${index}</span> ${name}`,
      style: { background: config.Colors.grey1, width: '20%' }
    },
    {
      text: fixed ? 'リストから選択' : '',
      component: fixed ? VSelect : VTextField,
      style: { textAlign: 'center' }
    },
    {
      text: `※ ${status}`,
      className: 'fit-content',
      style: { background: config.Colors.grey1, width: '12%' }
    }
  ]
}

export const rowIndexStatusRadios = (
  index: number,
  name: string,
  status: string,
  options: { text: string; value: string }[]
) => {
  return [
    {
      text: `<span class="index--circle">${index}</span> ${name}`,
      style: { background: config.Colors.grey1 }
    },
    {
      component: RadioGroup,
      items: options
    },
    {
      text: `※ ${status}`,
      style: { background: config.Colors.grey1, width: '12%' }
    }
  ]
}

export const drawTable = (items: TableItem[]) => {
  const data = groupBy(flatArray(items), 'rowIndex')
  console.log(data)
  return data
}

export function flatArray(array: TableCell[]) {
  let flated = [...array]
  while (flated.some((x) => x && x.children)) {
    flated = mergeParentWithChildren(flated) as TableCell[]
  }
  return flated.filter((x) => x)
}

function mergeParentWithChildren(array: TableCell[]) {
  const parent = array.filter((x) => x.children)
  const noChild = array.filter((x) => !x.children)
  const children = parent.map((x) => x.children).flat(1)
  parent.forEach((x) => {
    delete x.children
  })
  return [...noChild, ...parent, ...children]
}
