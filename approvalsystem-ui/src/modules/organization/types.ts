// eslint-disable-next-line @typescript-eslint/no-unused-vars
declare namespace Organization {
  type GetOrganationsResponse = {
    business_units: BusinessUnit.BusinessUnit[]
    departments: Department.Department[]
    divisions: Division.Division[]
    segments: Segment.Segment[]
  }
}
