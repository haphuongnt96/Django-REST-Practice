<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'

@Component({ components: {} })
export default class ApprovalRequestDetailTable extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  items = [1, 2]

  //#region COMPUTED
  get contents() {
    return this.$pageContents.APPROVAL
  }
  //#endregion
}
</script>

<template>
  <v-simple-table>
    <tbody>
      <tr>
        <td>
          <div class="d-flex align-center">
            <span>{{ contents.APP_ITEM_NAME }}</span>
            <v-spacer />
            <span>{{ contents.REQUIRED }}</span>
          </div>
        </td>
        <td>
          <v-text-field
            dense
            outlined
            placeholder="input here.."
            hide-details="auto"
          />
        </td>
        <td>{{ contents.REMARK_AND_NOTE }}</td>
      </tr>
      <tr>
        <td>{{ contents.APP_ITEM_NAME }}</td>
        <td>
          <v-select
            dense
            outlined
            placeholder="selection"
            hide-details="auto"
            :items="items"
          />
        </td>
        <td>{{ contents.REMARK_AND_NOTE }}</td>
      </tr>
      <tr>
        <td>{{ contents.APP_ITEM_NAME }}</td>
        <td>
          <v-radio-group dense row hide-details class="mt-0">
            <v-radio label="1" />
            <v-radio label="2" />
          </v-radio-group>
        </td>
        <td>{{ contents.REMARK_AND_NOTE }}</td>
      </tr>
      <tr>
        <td>{{ contents.APP_ITEM_NAME }}</td>
        <td></td>
        <td>{{ contents.REMARK_AND_NOTE }}</td>
      </tr>
    </tbody>
  </v-simple-table>
</template>

<style lang="scss" scoped>
.v-data-table {
  width: 100%;
}

td {
  &:first-child {
    width: 250px;
  }
}
</style>
