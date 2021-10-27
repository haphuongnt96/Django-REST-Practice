const APP_SIDE_BAR = {
  title: '社内申請'
}

const COMMON = {
  ADD: '追加',
  TABLE_NO_DATA: '対象のレコードはありません'
}

const APP_HEADER = {
  title: '社内申請',
  LOGOUT: 'ログアウト',
  USER_LOGIN: 'ログイン者',
  BACK: '戻る',
  CHANGE_PASS: 'パスワード変更',
  NEW_REGISTER: '新規申請'
}

const APPROVAL_TABS = {
  LIST_OF_NOTIFIERS: '通知者一覧',
  ADD_NOTIFIERS: '通知者追加',
  ADD_APPROVERS: '承認者追加',
  POSITION_NAME: '役職名',
  POSITION: '役職',
  NAME: '氏名',
  CONFIRMED_DATE: '確認日',
  LIST_OF_APPROVER: '承認者一覧',
  INSERT_ORDER: '挿入順位'
}

const APPROVAL = {
  APP_TITLE: '申請書名',
  APP_INFORMATION: '申請情報',
  APP_CONTENT: '申請内容',
  DEPARTMENT_NAME: '申請部署',
  APP_DATE: '申請日時',
  REQUEST_USER_NAME: '申請者名',
  APPLY: '申請',
  SAVE_DRAFT: '下書保存',
  CANCEL_APP: '申請取消',
  DELETE: ' 削除',
  APPROVE: '承認',
  DISAPPROVE: '否認',
  CANCEL: '承認取消',
  PRINT: ' 印刷',
  REQUIRED: '必須',
  APP_ITEM_NAME: '申請項目名',
  SELECTION: '選択肢',
  REMARK_AND_NOTE: '備考や注釈',
  SELECT: '選択',
  APPROVER: '承認者',
  ANNOUNT_PERSON: '通知者',
  COPY_FUNCTION: '申請複写',
  APPROVE_SUCCESS_MESS: '承認に成功しました',
  BTN_SEARCH: '検索',
  BTN_ADD: '追加',
  POP_NOTIFIER_ADD: '通知者追加',
  POP_NOTIFIER_POSITION: '役職名',
  APPROVE_FAIL_MESS: '承認に失敗しました',
  COMMENT_TITLE: 'コメント履歴',
  COMMENT_SAVE: 'コメント保存',
  COMMENT_REMAND: '差戻',
  COMMENT_APPROVER: '第1承認者',
  COMMENT_NO_TITLE: '承認状況No.',
  APPROVAL_ROUTE: '承認ルート',
  ADD_APPROVER: '承認者追加',
  ADD_NOTIFIER: '通知者追加'
}
const AUTHEN = {
  AU_TITLE: 'ログイン',
  AU_EMPLOYEEID: '社員ID',
  AU_PASSWORD: 'パスワード',
  AU_BUTTON: 'ログイン',
  BLANK_EMPLOYEEID: '社員IDを入力してください',
  BLANK_PASSWORD: 'パスワードを入力してください',
  AUTHEN_ERROR: '社員IDもしくはパスワードが正しくありません',
  CHANGE_PASS_TITLE: 'パスワード変更',
  CHANGE_PASS_OLDPASS: '現在のパスワード',
  CHANGE_PASS_NEWPASS: '新しいパスワード',
  CHANGE_PASS_NEWPASS_ERR: '有効なパスワードを入力してください',
  CHANGE_PASS_CONFIRMPASS: '新しいパスワード（確認）',
  CHANGE_PASS_BUTTON: '確認',
  NOT_SAME_PASSWORD: '新しいパスワードと（確認）には同じ内容を入力してください',
  NOT_CHANGE_PASS: '「現在のパスワード」と同一のものは使用できません'
}
const DASHBOARD = {
  DASH_TITLE: 'ログイン',
  APPLICANT: '申請者',
  NOTIFIER: '通知者',
  APPLICANT_CREATE_NEW: '新規作成',
  APPLICANT_APPLYING: '申請中',
  APPLICANT_REMAND: '差戻',
  APPLICANT_DRAFT: '下書き',
  APPLICANT_APPROVAL_NOTI: '承認通知',
  APPROVER: '承認者',
  UN_APPROVED: '未承認',
  UN_APPROVED_WAITING: '未承認 (順番待)',
  UN_APPROVED_UNFINISHED: '承認済（未完了分)',
  UN_APPROVED_CANCELLATION: '承認済（申請取消)',
  ABSENCE_NOTI: '不在通知',
  REMAND_NOTI: '差戻通知',
  APPROVAL_NOTI: '承認通知',
  FORM_APPLICANT_CONTENT: '申請内容',
  FORM_APPLICANT_CONTENT_SEARCH: '申請内容文言検索',
  FORM_STATUS: '状況',
  FORM_APPLICANT: '申請者',
  FORM_APPLICANT_DEPARTMENT: '申請部署',
  FORM_APPLICANT_DATE: '申請日',
  FORM_APPLICANT_LATEST_DATE: '最終申請日',
  FORM_SUBJECT: '件名',
  FORM_OBJECT: '物件',
  FORM_SEARCH: '検索',
  FORM_CLEAR: 'クリア',
  FORM_APPROVER: '承認者',
  FORM_APPROVAL_DATE: '承認日',
  FORM_NOTIFIER: '通知者',
  FORM_RECEIPT_NUMBER: '番号',
  CHECK_ONLY_SUBJECT: '対象部分のみ',
  CHECK_ABSENCE: '不在分',
  CHECK_BROWSING_AUTHORITY: '閲覧権限',
  CHECK_UNCONFIRMED_ONLY: '未確認のみ',
  CHECK_APPLICATION_CANCELLATION: '申請取消分',
  TABLE_RECEIPT_NUMBER: '番号',
  TABLE_APPLICATION_CONTENT: '申請内容',
  TABLE_TITLE: 'タイトル',
  TABLE_APPLICATION_DEPARTMENT: '申請部署名',
  TABLE_APPLICANT: '申請者',
  TABLE_STATUS: '状況',
  TABLE_NO_DATA: '対象のレコードはありません',
  POPUP_SEARCH_TITLE: '申請内容選択',
  POPUP_SEARCH_DEPARTMENT: '主幹部署',
  POPUP_SEARCH_CATEGORY: '分類',
  POPUP_SEARCH_CONTENT: '申請内容名',
  POPUP_SEARCH_DEPARTMENT_PLACEHOLDER: '部署名',
  POPUP_SEARCH_CATEGORY_PLACEHOLDER: '課名',
  POPUP_SEARCH_CONTENT_PLACEHOLDER: '分類名',
  POPUP_APPLICANT_TITLE: '社員検索',
  POPUP_APPLICANT_CATE1: '部',
  POPUP_APPLICANT_CATE2: '課',
  POPUP_APPLICANT_CATE3: '名前',
  POPUP_APPLICANT_CATE_PL1: '部署名',
  POPUP_APPLICANT_CATE_PL2: '課名',
  POPUP_APPLICANT_TABLE_TITLE1: '所属',
  POPUP_APPLICANT_TABLE_TITLE2: '社員コード',
  POPUP_APPLICANT_TABLE_TITLE3: '社員名',
  POPUP_SEARCH_OBJ_DEPARTMENT: '部',
  POPUP_SEARCH_OBJ_SECTION: '課',
  POPUP_SEARCH_OBJ_GROUP: 'グループ',
  POPUP_SEARCH_OBJ_DEPARTMENT_PL: '支店名',
  POPUP_SEARCH_OBJ_SECTION_PL: '営業所名',
  POPUP_SEARCH_OBJ_GROUP_PL: '氏名',
  POPUP_SEARCH_OBJ_CANCEL_CHECK: '解約物件',
  POPUP_SEARCH_OBJ_CODE: 'コード',
  POPUP_SEARCH_OBJ_NAME: '名称',
  POPUP_SEARCH_OBJ_LOCATION: '住所',
  POPUP_SEARCH_OBJ_INCHARGE: '担当者',
  BUTTON_CLEAR: 'クリア'
}
const $pageContents = {
  APP_SIDE_BAR,
  APP_HEADER,
  APPROVAL,
  AUTHEN,
  DASHBOARD,
  APPROVAL_TABS,
  COMMON
}

export default $pageContents
