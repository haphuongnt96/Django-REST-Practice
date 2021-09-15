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
        ? this.$config.Colors.green3
        : this.$config.Colors.red3
    }
  }

  get icon() {
    return (approval_status: boolean) => {
      return approval_status ? 'mdi-checkbox-marked-circle' : 'mdi-close-circle'
    }
  }

  get headerBg() {
    const approval_status = this.items[0]
      ? this.items[0].approval_status
      : false
    return approval_status ? '#8FAADC' : '#FDCC82'
  }
}
</script>

<template>
  <v-simple-table>
    <thead :style="{ background: headerBg }">
      <tr>
        <th colspan="2" class="text-center">{{ header }}</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="detail in items" :key="detail.approval_emp_fullname">
        <td>{{ detail.approval_emp_fullname }}</td>
        <td class="d-flex flex-column justify-center">
          <template v-if="detail.approval_status !== null">
            <v-icon size="16" :color="color(detail.approval_status)">
              {{ icon(detail.approval_status) }}
            </v-icon>
            {{ detail.updated_at }}
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
      color: #fff !important;
    }
  }
}
</style>
