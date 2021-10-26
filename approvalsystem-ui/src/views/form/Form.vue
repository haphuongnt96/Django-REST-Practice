<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import PropertyMasterRegistration from '@/static/forms/property-master-registration'
import ListCheckbox from '@/common/components/ui/ListCheckbox.vue'
import RadioGroupCell from './RadioGroupCell.vue'
//*===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊Methods

@Component({
  components: { ListCheckbox, RadioGroupCell }
})
export default class Form extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  formFields = []

  //*===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏===🍏Computed
  get form() {
    return PropertyMasterRegistration
  }
}
</script>

<template>
  <v-container fluid pa-0>
    <div class="text-h5 txt-text-1 text-center fw-600 mb-2">
      {{ form.caption }}
    </div>
    <template v-for="(table, tableIndex) in form.tables">
      <template v-if="table.note">
        <div v-html="table.note" :key="tableIndex"></div>
      </template>
      <v-simple-table v-else :key="tableIndex" :class="table.className">
        <thead>
          <th
            v-for="header in table.headers"
            :key="header.text"
            :colspan="header.colspan"
            :style="header.style"
          >
            {{ header.text }}
          </th>
        </thead>
        <tbody>
          <tr v-for="(row, i) in table.rows" :key="i">
            <td
              v-for="(cell, j) in row"
              :key="i + j"
              :style="cell.style"
              :colspan="cell.colspan"
              :rowspan="cell.rowspan"
              :class="cell.className"
            >
              <component
                dense
                hide-details="auto"
                v-if="cell.component"
                :is="cell.component"
                outlined
                :label="cell.text"
                :items="cell.items"
              />
              <template v-else>
                <span v-html="cell.text" />
              </template>
            </td>
          </tr>
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
