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

  type EmployeeAffiliation = {
    business_unit_id: string
    business_unit_nm: string
    department_id: string
    department_nm: string
    division_id: string
    division_nm: string
    emp_affiliation_id: number
    emp_id: number
    emp_nm: string
    main_flg: boolean
    segment_id: string
    segment_nm: string
  }

  type SearchEmployees = {
    limit: number
    offset: number
    emp_nm?: string
    segment_id?: string
    department_id?: string
  }

  type SearchUsers = {
    count: number
    results: EmployeeAffiliation[]
  }
}
