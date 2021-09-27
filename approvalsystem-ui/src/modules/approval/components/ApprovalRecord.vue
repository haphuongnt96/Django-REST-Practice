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
    return (approval_status: boolean) => {
      return approval_status
        ? this.$config.Colors.success
        : this.$config.Colors.error
    }
  }

  get icon() {
    return (approval_status: boolean) => {
      return approval_status ? '承認' : '差戻'
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
            <span
              v-bind:class="[
                detail.approval_status ? 'success-text' : 'error-text'
              ]"
            >
              {{ icon(detail.approval_status) }}
            </span>
            {{ detail.approval_date }}
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
