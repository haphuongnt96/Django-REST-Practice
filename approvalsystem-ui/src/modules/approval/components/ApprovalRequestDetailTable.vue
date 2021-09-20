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
  <v-card flat>
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
              placeholder="input here ..."
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
            <v-select
              class="vcl"
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
            <v-radio-group row hide-details class="mt-0">
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
  </v-card>
</template>

<style lang="scss" scoped>
.v-card,
.v-data-table {
  width: 100%;
}
tr:hover {
  background-color: transparent !important;
}
td {
  border: solid thin #000;
  padding: 12px 16px !important;
  &:first-child {
    width: 250px;
  }
}
</style>
