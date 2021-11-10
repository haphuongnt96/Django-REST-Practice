// eslint-disable-next-line @typescript-eslint/no-unused-vars
declare namespace Employee {
  type Employee = {
    emp_cd: string
    emp_nm: string
    affiliations: Affiliation[]
  }
  type Affiliation = {
    business_unit_nm: string
    department_nm: string
    segment_nm: string
    division_nm: string
  }
}
