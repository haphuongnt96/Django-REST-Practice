import config from '@/common/config'
import RadioGroup from '@/common/components/ui/RadioGroup.vue'
import { arrayFromNumber } from '@/common/helpers'

type TableCell = {
  text: string
  rowspan?: number
  colspan?: number
  key?: string
  value?: string
  children?: TableCell[]
}

type TableItem = TableCell & {
  children?: TableCell[]
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

export const drawTable = (items: TableItem[]) => {
  const data = [] as TableItem[]
  items.forEach((item) => {
    const index = 0
    let row = [item]
    console.log(row)
    item.rowspan = item.rowspan || 1
    while (item.rowspan && index < item.rowspan) {
      let current = item.children
      while (current && current.length) {
        const nextCell = current[index]
        if (!current.some((x) => x.children && x.children.length)) {
          row = [...row, ...current.slice(0, 3)]
          break
        }
        row.push(nextCell)
        current = nextCell && nextCell.children
      }
      data.push(row)
    }
  })
  console.log(data)
  return data
}
