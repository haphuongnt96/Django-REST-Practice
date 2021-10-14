<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import ApprovalPopupNotifierTable from '@/modules/approval/components/ApprovalPopupNotifierTable.vue'
import ApprovalPopupNotifierTable from '@/modules/approval/components/ApprovalPopupNotifierTable.vue'
import PopSearchEmployee from '@/modules/employee/PopSearchEmployee.vue'
@Component({
  components: {
    ApprovalPopupNotifierTable,
    PopSearchEmployee
  }
})
export default class ApprovalPopupNotifier extends Vue {
  //*===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎===🍎Data
  //#region COMPUTED
  name = ''
  empCode = ''
  empName = ''
  valid = true
  dialog = false
  get contents() {
    return this.$pageContents.APPROVAL
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
    // this.$emit('setDataSearch', value)
    this.dialog = false
  }
  setEmployee(data) {
    this.empCode = data.emID
    this.empName = data.emName
  }
}
</script>

<template>
  <v-dialog v-model="dialog" width="1000">
    <template v-slot:activator="{ on, attrs }">
      <v-btn
        class="btn-white"
        width="120"
        :color="$config.Colors.red1"
        v-bind="attrs"
        v-on="on"
      >
        {{ contents.ANNOUNT_PERSON }}
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
                  <td>{{ contents.POP_NOTIFIER_ADD }}</td>
                  <td class="select-deparment inline-input-nmr">
                    <v-text-field
                      v-model="empCode"
                      dense
                      outlined
                      hide-details="auto"
                    ></v-text-field>
                    <v-text-field
                      v-model="empName"
                      dense
                      outlined
                      hide-details="auto"
                    ></v-text-field>
                  </td>
                  <td>
                    <!-- <v-btn :disabled="!valid" class="mr-4">
                      {{ contents.BTN_SEARCH }}
                    </v-btn> -->
                    <PopSearchEmployee @setData="setEmployee" />
                  </td>
                  <td>{{ contents.POP_NOTIFIER_POSITION }}</td>
                  <td>
                    <v-text-field
                      v-model="name"
                      dense
                      outlined
                      hide-details="auto"
                    ></v-text-field>
                  </td>
                  <td>
                    <v-btn :disabled="!valid" class="mr-4">
                      {{ contents.BTN_ADD }}
                    </v-btn>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="search__form-result">
            <ApprovalPopupNotifierTable
              @applicationCotent="applicationCotent"
            />
          </div>
        </div>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<style lang="scss" scoped></style>
