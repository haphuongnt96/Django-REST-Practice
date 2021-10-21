<script lang="ts">
import { Component, Emit, Vue } from 'vue-property-decorator'
import PopSearchEmployeeTable from '@/modules/employee/components/PopSearchEmployeeTable.vue'
@Component({
  components: {
    PopSearchEmployeeTable
  }
})
export default class PopSearchEmployee extends Vue {
  //#region Data
  name = ''
  valid = true
  dialog = false
  selectStatus = [
    { state: 'Florida', abbr: 'FL' },
    { state: 'Georgia', abbr: 'GA' },
    { state: 'Nebraska', abbr: 'NE' },
    { state: 'California', abbr: 'CA' },
    { state: 'New York', abbr: 'NY' }
  ]
  //#endregion

  //#region Emit
  @Emit('setData') setData(employee: Employee.Employee) {
    return employee
  }
  //#endregion

  //#region Computed
  get contents() {
    return this.$pageContents.DASHBOARD
  }
  //#endregion

  //#region Methods
  select(employee: Employee.Employee) {
    this.setData(employee)
    this.dialog = false
  }
  //#endregion
}
</script>

<template>
  <v-dialog v-model="dialog" width="1000">
    <template v-slot:activator="{ on, attrs }">
      <v-btn color="grey" v-bind="attrs" v-on="on">
        {{ contents.FORM_SEARCH }}
      </v-btn>
    </template>

    <v-card class="pop-search">
      <v-card-title class="text-h5 grey lighten-2">
        {{ contents.POPUP_APPLICANT_TITLE }}
      </v-card-title>
      <v-card-text>
        <div class="search__form">
          <div class="search__form-header">
            <table>
              <tbody>
                <tr>
                  <td>{{ contents.POPUP_APPLICANT_CATE1 }}</td>
                  <td>
                    <v-select
                      :items="selectStatus"
                      :label="contents.POPUP_APPLICANT_CATE_PL1"
                      item-text="state"
                      item-value="abbr"
                      dense
                      outlined
                      hide-details="auto"
                    />
                  </td>
                  <td>{{ contents.POPUP_APPLICANT_CATE2 }}</td>
                  <td>
                    <v-select
                      :items="selectStatus"
                      :label="contents.POPUP_APPLICANT_CATE_PL2"
                      item-text="state"
                      item-value="abbr"
                      dense
                      outlined
                      hide-details="auto"
                    />
                  </td>
                  <td>{{ contents.POPUP_APPLICANT_CATE3 }}</td>
                  <td>
                    <v-form
                      class="search__form-control"
                      ref="form"
                      v-model="valid"
                    >
                      <v-text-field
                        v-model="name"
                        dense
                        outlined
                        hide-details="auto"
                        required
                      ></v-text-field>
                      <v-btn :disabled="!valid" class="mr-4">
                        {{ contents.FORM_SEARCH }}
                      </v-btn>
                    </v-form>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="search__form-result">
            <PopSearchEmployeeTable @select="select" />
          </div>
        </div>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<style lang="scss" scoped></style>
