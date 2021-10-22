<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import PropertyMasterRegistration from '@/static/forms/property-master-registration'
//*===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊===🌊Methods

@Component({
  components: {}
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
  <v-container fluid>
    <div class="text-h5 txt-text-1">{{ form.caption }}</div>
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
            >
              <component
                dense
                hide-details="auto"
                v-if="cell.component"
                :is="cell.component"
                :label="cell.text"
                :items="cell.items"
              />
              <template v-else>
                {{ cell.text }}
              </template>
            </td>
          </tr>
        </tbody>
      </v-simple-table>
    </template>
  </v-container>
</template>

<style lang="scss" scoped>
.container {
  background: #fff;
}
</style>
