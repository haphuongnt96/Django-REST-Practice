<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import PopSearchEmployeeTable from '@/modules/employee/PopSearchEmployeeTable.vue'
@Component({
  components: {
    PopSearchEmployeeTable
  }
})
export default class PopSearchEmployee extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  //#region COMPUTED
  name = ''
  valid = true
  dialog = false
  get contents() {
    return this.$pageContents.DASHBOARD
  }
  selectStatus = [
    { state: 'Florida', abbr: 'FL' },
    { state: 'Georgia', abbr: 'GA' },
    { state: 'Nebraska', abbr: 'NE' },
    { state: 'California', abbr: 'CA' },
    { state: 'New York', abbr: 'NY' }
  ]
  //#endregion
  //handle call child function
  applicationCotent(value) {
    this.$emit('setData', value)
    this.dialog = false
  }
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
            <PopSearchEmployeeTable @applicationCotent="applicationCotent" />
          </div>
        </div>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<style lang="scss" scoped></style>
