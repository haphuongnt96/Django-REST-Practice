<script lang="ts">
import ListCheckbox from '@/common/components/ui/ListCheckbox.vue'
import EventBus from '@/common/eventBus'
import { drawTableElement, drawTableHeader } from '@/modules/form/helpers'
import eventBus from '@/plugins/eventBus'
import { Component, Vue, Prop } from 'vue-property-decorator'
import RadioGroupCell from './RadioGroupCell.vue'
//*===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊Methods

@Component({
  components: { ListCheckbox, RadioGroupCell }
})
export default class Form extends Vue {
  //#region Prop
  @Prop({
    default: function () {
      return []
    }
  })
  items: ApplicationForm.RequestDetail[]
  //#endregion

  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  drawTableElement = drawTableElement
  drawTableHeader = drawTableHeader

  //*===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏Computed
  get formFields() {
    return this.items
  }

  set formFields(value: ApplicationForm.RequestDetail[]) {
    this.$emit('update:items', value)
  }

  //#region Method
  handleInput(value: string, item: ApplicationForm.RequestDetail) {
    item.request_column_val = value
    this.syncFormData(item)
  }

  syncFormData(item: ApplicationForm.RequestDetail) {
    this.formFields.forEach((root) => {
      const target = root.request_detail_children.find(
        (x) => x.request_column_id === item.request_column_id
      )
      if (target) target.request_column_val = item.request_column_val
    })
  }
  //#endregion
}
</script>

<template>
  <v-container fluid pa-0>
    <template v-for="item in formFields">
      <v-simple-table :key="item.request_column_id">
        <thead>
          <th
            :colspan="drawTableHeader(item).colspan"
            :style="drawTableHeader(item).style"
          >
            {{ item.column_nm }}
          </th>
        </thead>
        <tbody>
          <template v-for="(row, i) in item.request_detail_children">
            <tr v-if="!row.request_detail_children.length" :key="i">
              <td
                v-for="(cell, j) in drawTableElement(row)"
                :key="i + j"
                :style="cell.style"
                :colspan="cell.colspan"
                :rowspan="cell.rowspan"
                :class="cell.className"
              >
                <component
                  :is="cell.component"
                  v-if="cell.component"
                  :value="cell.request_column_val"
                  dense
                  hide-details="auto"
                  outlined
                  :items="cell.choices"
                  item-text="choice_nm"
                  item-value="choice_id"
                  :validations="cell.rules"
                  @change="(value) => handleInput(value, cell)"
                />
                <template v-else>
                  <span v-html="cell.text" />
                </template>
              </td>
            </tr>
            <tr
              v-for="(childRow, childRowIndex) in drawTableElement(row)"
              v-else
              :key="childRow.request_column_id"
            >
              <td
                v-for="(cell, cellIndex) in childRow"
                :key="childRowIndex + cellIndex"
                :style="cell.style"
                :colspan="cell.colspan"
                :rowspan="cell.rowspan"
                :class="cell.className"
              >
                <component
                  :is="cell.component"
                  v-if="cell.component"
                  :validations="cell.rules"
                  :value="cell.request_column_val"
                  dense
                  hide-details="auto"
                  outlined
                  :items="cell.choices"
                  item-text="choice_nm"
                  item-value="choice_id"
                  @change="(value) => handleInput(value, cell)"
                />
                <template v-else>
                  <span v-html="cell.text" />
                </template>
              </td>
            </tr>
          </template>
        </tbody>
      </v-simple-table>
    </template>
  </v-container>
</template>

<style lang="scss" scoped>
::v-deep {
  .index--circle {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    height: 18px;
    width: 18px;
    border-radius: 50%;
    border: solid thin #000;
  }
  .v-text-field__details {
    margin-bottom: 0 !important;
  }
}

table {
  td {
    &.fit-content {
      white-space: nowrap;
    }
    &.td--bold {
      font-weight: 600;
      background: $grey-1;
    }
  }
}
</style>
