import config from '@/common/config'
import RadioGroup from '@/common/components/ui/RadioGroup.vue'
import { arrayFromNumber } from '@/common/helpers'

type TableCell = {
  text: string
  rowspan?: number
  colspan?: number
  key?: string
  value?: string
}

type TableItem = TableCell & {
  children: TableCell[]
}

export const rowIndexStatus = (name: string, status: string, fixed = false) => {
  return [
    {
      className: 'index--circle',
      text: name,
      style: { background: config.Colors.grey1 }
    },
    {
      text: fixed ? 'リストから選択' : '',
      style: fixed
        ? {
            textAlign: 'center',
            background: config.Colors.pink3,
            color: config.Colors.red1
          }
        : null
    },
    {
      text: `※ ${status}`,
      style: { background: config.Colors.grey1 }
    }
  ]
}

export const rowIndexStatusRadios = (
  name: string,
  status: string,
  options: { text: string; value: string }[]
) => {
  return [
    {
      className: 'index--circle',
      text: name,
      style: { background: config.Colors.grey1 }
    },
    {
      component: RadioGroup,
      items: options
    },
    {
      text: `※ ${status}`,
      style: { background: config.Colors.grey1 }
    }
  ]
}

export const rowType1 = (cells: TableCell[]) => {
  const parent = cells[0]
  const children = cells.slice(1)
  const childHeaders = children.map((x) => ({
    text: x.text,
    style: { background: config.Colors.grey1 }
  }))
  const headers = [
    ...[
      {
        text: parent.text,
        rowspan: parent.rowspan,
        colspan: parent.colspan,
        style: { background: config.Colors.grey1 }
      }
    ],
    ...childHeaders
  ]
  const childCells = children.map((x) => ({
    text: '',
    key: x.key
  }))
  return { headers, cells: childCells }
}

const drawTable = (items: TableItem[]) => {
  const data = []
  items.forEach((item) => {
    const rowspan = item.rowspan || 0
    // for (let i in arrayFromNumber(rowspan - 1)) {

    // }
    data.push(item)
  })
  return
}
