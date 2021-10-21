<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator'
import { format } from 'date-fns'

@Component({ components: {} })
export default class ApprovalRecord extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  @Prop() header: string
  @Prop({
    default: function () {
      return []
    }
  })
  items: Approvals.ApprovalRouteDetailResponse[]
  format = format

  get color() {
    return (approval_status: string) => {
      switch (approval_status) {
        case '1':
          return 'success-text'
        case '2':
          return 'error-text'
        default:
          return ''
      }
    }
  }

  get icon() {
    return (approval_status: string) => {
      switch (approval_status) {
        case '0':
          return '-'
        case '1':
          return '承認'
        case '2':
          return '差戻'
        default:
          return '-'
      }
    }
  }
}
</script>

<template>
  <v-simple-table>
    <thead>
      <tr>
        <th colspan="2" class="text-center">{{ header }}</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="detail in items" :key="detail.detail_no">
        <td>{{ detail.approval_emp_nm }}</td>
        <td class="d-flex flex-column justify-center text-center">
          <template v-if="detail.approval_status !== null">
            <span v-bind:class="[color(detail.approval_status)]">
              {{ icon(detail.approval_status) }}
            </span>
            <span v-if="detail.approval_date">
              {{ detail.approval_date | date('MM/dd') }}
            </span>
          </template>
        </td>
      </tr>
    </tbody>
  </v-simple-table>
</template>

<style lang="scss" scoped>
::v-deep {
  table {
    th,
    td {
      border: solid 1px #000;
    }
    th {
      background: $pink-2;
    }
  }
}
</style>
