<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import DashboardPopupObjectTable from '@/modules/dashboard/components/DashboardPopupObjectTable.vue'
@Component({
  components: {
    DashboardPopupObjectTable
  }
})
export default class DashboardPopupObject extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  //#region COMPUTED
  name = ''
  valid = true
  dialog = false
  get contents() {
    return this.$pageContents.DASHBOARD
  }
  selectStatus = [
    { state: '大阪北支店', abbr: 'OK' },
    { state: '大阪南支店', abbr: 'OM' },
    { state: '京奈支店', abbr: 'KE' },
    { state: '京都営業所', abbr: 'KY' },
    { state: '神戸・西日本支店', abbr: 'KO' }
  ]
  //#endregion
  //handle call child function
  applicationCotent(value) {
    this.$emit('setObjectData', value)
    this.dialog = false
  }
  getPropartyData() {
    this.$refs.propertysearch.getpropartydata()
  }
}
</script>

<template>
  <v-dialog v-model="dialog" width="1400">
    <template v-slot:activator="{ on, attrs }">
      <v-btn color="grey" v-bind="attrs" v-on="on">
        {{ contents.FORM_SEARCH }}
      </v-btn>
    </template>

    <v-card class="pop-search">
      <v-card-title class="text-h5 grey lighten-2">
        {{ contents.POPUP_BUKKEN_TITLE }}
      </v-card-title>
      <v-card-text>
        <div class="search__form">
          <div class="search__form-header">
            <table>
              <tbody>
                <tr>
                  <td>{{ contents.POPUP_SEARCH_OBJ_DEPARTMENT }}</td>
                  <td>
                    <v-select
                      :items="selectStatus"
                      :label="contents.POPUP_SEARCH_OBJ_DEPARTMENT_PL"
                      item-text="state"
                      item-value="abbr"
                      dense
                      outlined
                      hide-details="auto"
                    />
                  </td>
                  <td>{{ contents.POPUP_SEARCH_OBJ_SECTION }}</td>
                  <td>
                    <v-select
                      :items="selectStatus"
                      :label="contents.POPUP_SEARCH_OBJ_SECTION_PL"
                      item-text="state"
                      item-value="abbr"
                      dense
                      outlined
                      hide-details="auto"
                    />
                  </td>
                  <td>{{ contents.POPUP_SEARCH_OBJ_GROUP }}</td>
                  <td>
                    <v-select
                      :items="selectStatus"
                      :label="contents.POPUP_SEARCH_OBJ_GROUP_PL"
                      item-text="state"
                      item-value="abbr"
                      dense
                      outlined
                      hide-details="auto"
                    />
                  </td>
                  <td>
                    <v-checkbox
                      :label="contents.POPUP_SEARCH_OBJ_CANCEL_CHECK"
                      hide-details="auto"
                      dense
                    ></v-checkbox>
                  </td>
                </tr>
              </tbody>
            </table>
            <v-form class="search__form-control" ref="form" v-model="valid">
              <table>
                <tbody>
                  <tr>
                    <td>{{ contents.POPUP_SEARCH_OBJ_CODE }}</td>
                    <td>
                      <v-text-field
                        dense
                        outlined
                        hide-details="auto"
                      ></v-text-field>
                    </td>
                    <td>{{ contents.POPUP_SEARCH_OBJ_NAME }}</td>
                    <td>
                      <v-text-field
                        dense
                        outlined
                        hide-details="auto"
                      ></v-text-field>
                    </td>
                    <td>{{ contents.POPUP_SEARCH_OBJ_LOCATION }}</td>
                    <td>
                      <v-text-field
                        dense
                        outlined
                        hide-details="auto"
                      ></v-text-field>
                    </td>
                    <td>{{ contents.POPUP_SEARCH_OBJ_INCHARGE }}</td>
                    <td>
                      <v-text-field
                        dense
                        outlined
                        hide-details="auto"
                      ></v-text-field>
                    </td>
                    <td class="inline__element">
                      <v-btn
                        :disabled="!valid"
                        class="mr-4"
                        @click="getPropartyData()"
                      >
                        {{ contents.FORM_SEARCH }}
                      </v-btn>
                      <v-btn color="grey">
                        {{ contents.BUTTON_CLEAR }}
                      </v-btn>
                    </td>
                  </tr>
                </tbody>
              </table>
            </v-form>
          </div>
          <div class="search__form-result">
            <DashboardPopupObjectTable
              ref="propertysearch"
              @applicationCotent="applicationCotent"
            />
          </div>
        </div>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<style lang="scss" scoped></style>
