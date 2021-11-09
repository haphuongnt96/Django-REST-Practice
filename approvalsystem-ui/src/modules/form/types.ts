// eslint-disable-next-line @typescript-eslint/no-unused-vars
declare namespace ApplicationForm {
  type RequestDetail = {
    choices: Choice[]
    column_nm: string
    column_type_id: string
    column_type_nm: ColumnTypeName
    max_length: number
    request_column_id: string
    request_column_val: string
    request_detail_children: RequestDetail[]
    required: boolean
    notes: string
  }

  type Choice = {
    choice_id: string
    choice_nm: string
  }

  enum ColumnTypeName {
    HEADER = 'header',
    INPUT_TEXT = 'input_text',
    SELECTION = 'selection',
    RADIO = 'radio'
  }
}
