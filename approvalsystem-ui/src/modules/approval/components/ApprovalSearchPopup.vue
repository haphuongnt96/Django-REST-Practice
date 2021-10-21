<script lang="ts">
import AppDialog from '@/common/components/ui/AppDialog.vue'
import DashboardDetailSearchTable from '@/modules/dashboard/components/DashboardDetailSearchTable.vue'
import { Component, Mixins } from 'vue-property-decorator'
@Component({
  components: {
    DashboardDetailSearchTable
  }
})
export default class ApprovalSearchPopup extends Mixins(AppDialog) {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  //#region COMPUTED
  name = ''
  valid = true
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
  applicationCotent(department: { department: string }) {
    this.$emit('setDataSearch', department)
    this.isOpen = false
  }
}
</script>

<template>
  <v-dialog v-model="isOpen" width="1000">
    <v-card class="pop-search">
      <v-card-title class="text-h5 grey lighten-2">
        {{ contents.POPUP_SEARCH_TITLE }}
      </v-card-title>
      <v-card-text>
        <div class="search__form">
          <div class="search__form-header">
            <table>
              <tbody>
                <tr>
                  <td>{{ contents.POPUP_SEARCH_DEPARTMENT }}</td>
                  <td class="select-deparment">
                    <v-select
                      :items="selectStatus"
                      :label="contents.POPUP_SEARCH_DEPARTMENT_PLACEHOLDER"
                      item-text="state"
                      item-value="abbr"
                      dense
                      outlined
                      hide-details="auto"
                    />
                    <v-select
                      :items="selectStatus"
                      :label="contents.POPUP_SEARCH_CATEGORY_PLACEHOLDER"
                      item-text="state"
                      item-value="abbr"
                      dense
                      outlined
                      hide-details="auto"
                    />
                  </td>
                  <td>{{ contents.POPUP_SEARCH_CATEGORY }}</td>
                  <td>
                    <v-select
                      :items="selectStatus"
                      :label="contents.POPUP_SEARCH_CONTENT_PLACEHOLDER"
                      item-text="state"
                      item-value="abbr"
                      dense
                      outlined
                      hide-details="auto"
                    />
                  </td>
                  <td>{{ contents.POPUP_SEARCH_CONTENT }}</td>
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
            <DashboardDetailSearchTable
              @applicationCotent="applicationCotent"
            />
          </div>
        </div>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<style lang="scss" scoped></style>
