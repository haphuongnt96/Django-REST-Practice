<script lang="ts">
import { Component, Emit, Prop, Vue, Watch } from 'vue-property-decorator'
import PopSearchEmployeeTable from '@/modules/employee/components/PopSearchEmployeeTable.vue'
import CONSTANTS from '@/common/constant'
// eslint-disable-next-line @typescript-eslint/no-var-requires
const debounce = require('lodash.debounce')

@Component({
  components: {
    PopSearchEmployeeTable
  }
})
export default class PopSearchEmployee extends Vue {
  //#region Prop
  @Prop() disabledIds: number[]
  //#endregion

  //#region Data
  debounceEmployeeNmChanged = debounce(this.employeeNmChanged, 800)
  valid = true
  dialog = false
  searchParams: Employee.SearchEmployees = {
    limit: CONSTANTS.VTABLE_DATA_CONFIG.ITEMS_PER_PAGE,
    offset: CONSTANTS.VTABLE_DATA_CONFIG.OFFSET,
    emp_nm: ''
  }
  employees: Employee.EmployeeAffiliation[] = []
  totalItems = 0
  departments: Department.Department[] = []
  segments: Segment.Segment[] = []
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

  //#region Hook
  created() {
    this.getOrganizations()
    this.searchEmployee()
  }
  //#endregion

  //#region Watch
  @Watch('searchParams', { deep: true }) onSearchParamsUpdated() {
    this.searchEmployee()
  }
  //#endregion

  //#region Methods
  async searchEmployee() {
    const [err, res] = await this.$api.employee.searchEmployeeAffiliations(
      this.searchParams
    )
    if (!err && res) {
      this.totalItems = res.count
      this.employees = res.results
    }
  }

  async getOrganizations() {
    const [err, res] = await this.$api.organization.getOrganizations()
    if (!err && res) {
      const { departments, segments } = res
      this.departments = departments
      this.segments = segments
    }
  }

  select(employee: Employee.Employee) {
    this.setData(employee)
    this.dialog = false
  }

  employeeNmChanged(value: string) {
    this.searchParams.emp_nm = value
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
        <div class="d-flex align-center gap-4 mb-5">
          <div class="d-flex align-center flex-gap-2 wrap">
            {{ contents.POPUP_APPLICANT_CATE1 }}
            <v-select
              v-model="searchParams.department_id"
              :items="departments"
              :label="contents.POPUP_APPLICANT_CATE_PL1"
              item-text="department_nm"
              item-value="department_id"
              dense
              outlined
              hide-details="auto"
              clearable
            />
          </div>
          <div class="d-flex align-center flex-gap-2 wrap">
            {{ contents.POPUP_APPLICANT_CATE2 }}
            <v-select
              v-model="searchParams.segment_id"
              :items="segments"
              :label="contents.POPUP_APPLICANT_CATE_PL2"
              item-text="segment_nm"
              item-value="segment_id"
              dense
              clearable
              outlined
              hide-details="auto"
            />
          </div>
          <div class="d-flex align-center flex-gap-2 wrap">
            {{ contents.POPUP_APPLICANT_CATE3 }}
            <v-text-field
              dense
              outlined
              hide-details="auto"
              required
              @input="employeeNmChanged"
            />
          </div>
          <v-btn :disabled="!valid" class="mr-4" @click="getDetailTable()">
            {{ contents.POPUP_SEARCH_SEARCH }}
          </v-btn>
        </div>
        <div class="search__form-result">
          <PopSearchEmployeeTable
            :disabledIds="disabledIds"
            :searchParams.sync="searchParams"
            :totalItems="totalItems"
            :items="employees"
            @select="select"
          />
        </div>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<style lang="scss" scoped>
.wrap {
  flex-wrap: wrap;
}

.gap-4 {
  gap: 16px;
}
</style>
