// eslint-disable-next-line @typescript-eslint/no-unused-vars
declare namespace Auth {
  type User = {
    //email?? usernameのまちがい？
    emp_nm: string
    email: string
    password: string
    access: string
    refresh: string
    affiliations: Affiliation[]
  }

  type Affiliation = Department.Department & Segment.Segment
}
