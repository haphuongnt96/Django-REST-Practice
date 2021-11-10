<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import DashboardDetailSearchTable from '@/modules/dashboard/components/DashboardDetailSearchTable.vue'
@Component({
  components: {
    DashboardDetailSearchTable
  }
})
export default class DashboardDetailPopup extends Vue {
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
    this.$emit('setDataSearch', value)
    this.dialog = false
  }
  getApplicationContentsData() {
    this.$refs.applicationcontentssearch.getapplicationcontentsdata()
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
                      <v-btn
                        :disabled="!valid"
                        class="mr-4"
                        @click="getApplicationContentsData()"
                      >
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
              ref="applicationcontentssearch"
            />
          </div>
        </div>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<style lang="scss" scoped></style>
