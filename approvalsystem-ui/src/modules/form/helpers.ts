import AppTextField from '@/common/components/ui/AppTextField.vue'
import RadioGroup from '@/common/components/ui/RadioGroup.vue'
import config from '@/common/config'
import { VSelect } from 'vuetify/lib'
import { ColumnTypeName } from './enum'
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
      component: fixed ? VSelect : AppTextField,
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

export const childrenRow = (item: ApprovalType.RequestDetail) => {
  const component = {
    [ColumnTypeName.SELECTION]: VSelect,
    [ColumnTypeName.HEADER]: null,
    [ColumnTypeName.INPUT_TEXT]: AppTextField,
    [ColumnTypeName.RADIO]: RadioGroup
  }
  const {
    request_detail_children,
    column_nm,
    request_column_id,
    column_type_nm,
    notes,
    choices
  } = item
  if (request_detail_children.length)
    return [
      [
        {
          text: `<span class="index--circle">${
            +request_column_id - 1
          }</span> ${column_nm}`,
          style: { background: config.Colors.grey1, width: '15%' },
          rowspan: request_detail_children.length
        },
        {
          text: request_detail_children[0].column_nm,
          style: { background: config.Colors.grey1, width: '20%' }
        },
        {
          component: component[request_detail_children[0].column_type_nm],
          style: { textAlign: 'center' },
          choices,
          request_column_id: item.request_column_id,
          request_column_val: item.request_column_val,
          rules: item.required ? 'required' : ''
        },
        {
          text: `※ ${notes}`,
          className: 'fit-content',
          style: { background: config.Colors.grey1, width: '12%' },
          rowspan: request_detail_children.length
        }
      ],
      ...request_detail_children.slice(1).map((x) => [
        {
          text: x.column_nm,
          style: { background: config.Colors.grey1, width: '20%' }
        },
        {
          component: component[column_type_nm],
          style: { textAlign: 'center' },
          choices,
          request_column_id: item.request_column_id,
          request_column_val: item.request_column_val,
          rules: item.required ? 'required' : ''
        }
      ])
    ]
  return [
    {
      text: `<span class="index--circle">${
        +request_column_id - 1
      }</span> ${column_nm}`,
      style: { background: config.Colors.grey1, width: '20%' },
      colspan: 2
    },
    {
      component: component[column_type_nm],
      style: { textAlign: 'center' },
      choices,
      request_column_id: item.request_column_id,
      request_column_val: item.request_column_val,
      rules: item.required ? 'required' : ''
    },
    {
      text: `※ ${notes}`,
      className: 'fit-content',
      style: { background: config.Colors.grey1, width: '12%' }
    }
  ]
}

export const drawTableElement = (item: ApprovalType.RequestDetail) => {
  return childrenRow(item)
}

export const drawTableHeader = (item: ApprovalType.RequestDetail) => {
  return {
    text: item.column_nm,
    colspan: 4,
    style: { background: config.Colors.grey1 }
  }
}

export const splitToTables = (items: ApprovalType.RequestDetail[]) => {
  const tables = {} as {
    [key in string]: ApprovalType.RequestDetail[]
  }
  items.reduce((acc, cur) => {
    if (
      cur.column_type_nm === ColumnTypeName.HEADER &&
      !cur.request_detail_children.length
    ) {
      if (!acc[cur.column_nm]) acc[cur.column_nm] = [cur]
      else acc[cur.column_nm].push(cur)
    }
    return acc
  }, tables)
}
