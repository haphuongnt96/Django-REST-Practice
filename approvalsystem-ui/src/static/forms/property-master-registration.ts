import config from '@/common/config'
import { CellComponent } from '@/modules/form/enum'
import {
  drawTable,
  rowIndexStatus,
  rowIndexStatusRadios
} from '@/modules/form/helpers'
import { VTextField } from 'vuetify/lib'

const radios = [
  {
    text: '',
    colspan: 3,
    className: 'pa-0',
    component: CellComponent.RADIO_GROUP_CELL,
    items: [
      {
        text: '新規',
        description: '新規・リプレイスにより新規登録する場合'
      },
      {
        text: '変更',
        description: '登録内容の変更をする場合'
      },
      {
        text: '解約',
        description: '管理解約になった場合'
      }
    ]
  }
]
const params0 = [
  {
    text: '申請番号',
    rowIndex: 0,
    colspan: 2,
    className: 'td--bold',
    style: {
      width: '30%'
    }
  },
  {
    text: '',
    rowIndex: 0,
    component: VTextField
  },
  {
    text: '申請日',
    rowIndex: 1,
    colspan: 2,
    className: 'td--bold'
  },
  {
    text: '',
    rowIndex: 1,
    component: VTextField
  },
  {
    text: '申請者<br/>OA担当者',
    rowIndex: 3,
    rowspan: 2,
    className: 'td--bold'
  },
  {
    text: '所属部署',
    rowIndex: 3,
    className: 'td--bold'
  },
  {
    text: '',
    rowIndex: 3,
    component: VTextField
  },
  {
    text: '氏名',
    rowIndex: 4,
    className: 'td--bold'
  },
  {
    text: '',
    rowIndex: 4,
    component: VTextField
  }
]
const params1 = [
  {
    rowIndex: 0,
    text: '管理部署使用欄',
    rowspan: 2,
    colspan: 2,
    className: 'td--bold',
    style: {
      width: '40%',
      fontSize: '20px'
    }
  },
  {
    rowIndex: 0,
    text: '登録承認',
    className: 'td--bold',
    style: { textAlign: 'center' }
  },
  {
    rowIndex: 0,
    text: '完了承認',
    className: 'td--bold',
    style: { textAlign: 'center' }
  },
  {
    rowIndex: 0,
    text: '受託会計部登録',
    className: 'td--bold',
    style: { textAlign: 'center' }
  },
  {
    rowIndex: 0,
    text: '経理課登録者',
    className: 'td--bold',
    style: { textAlign: 'center' }
  },
  {
    rowIndex: 0,
    text: '登録者',
    className: 'td--bold',
    style: { textAlign: 'center' }
  },
  {
    rowIndex: 1,
    text: '',
    component: VTextField
  },
  {
    rowIndex: 1,
    text: '',
    component: VTextField
  },
  {
    rowIndex: 1,
    text: '',
    component: VTextField
  },
  {
    rowIndex: 1,
    text: '',
    component: VTextField
  },
  {
    rowIndex: 1,
    text: '',
    component: VTextField
  }
]

const params2 = [
  {
    text: '区分',
    rowIndex: 2,
    colspan: 2,
    className: 'td--bold',
    style: {
      textAlign: 'center',
      width: '40%'
    }
  },
  {
    text: '登録内容',
    rowIndex: 2,
    className: 'td--bold',
    style: { textAlign: 'center' }
  },
  {
    text: '物件情報管理システム',
    rowspan: 2,
    rowIndex: 3,
    style: { background: config.Colors.grey1 },
    children: [
      {
        text: '物件マスタ',
        style: { background: config.Colors.grey1 },
        rowIndex: 3,
        children: [
          {
            rowIndex: 3,
            text: '物件情報管理システム',
            component: CellComponent.LIST_CHECKBOX,
            items: [
              { text: '物件コード' },
              { text: '物件名' },
              { text: '物件カナ' },
              { text: '物件' },
              { text: '部署' },
              { text: 'グループ' },
              { text: '会計年度開始月' },
              { text: '管理開始日' },
              { text: '管理終了日' },
              { text: '郵便番号' },
              { text: '住所・所在地' },
              { text: '管理' },
              { text: '仲介重説申込' }
            ]
          }
        ]
      },
      {
        text: '棟マスタ',
        rowIndex: 4,
        style: { background: config.Colors.grey1 },
        children: [
          {
            rowIndex: 4,
            component: CellComponent.LIST_CHECKBOX,
            items: [
              { text: '棟コード' },
              { text: '棟名' },
              { text: '郵便番号' },
              { text: '住所' },
              { text: '地上・地下階数' },
              { text: '塔屋' },
              { text: '住戸・店舗数' },
              { text: '建築・延床面積' },
              { text: '竣工年月' },
              { text: '事業主' },
              { text: '設計・施工・販売会社' }
            ]
          }
        ]
      }
    ]
  },
  {
    text: 'Office 365',
    rowIndex: 5,
    style: { background: config.Colors.grey1 },
    children: [
      {
        text: 'マンション共有',
        rowIndex: 5,
        style: { background: config.Colors.grey1 },
        children: [
          {
            component: CellComponent.LIST_CHECKBOX,
            rowIndex: 5,
            items: [
              { text: '物件フォルダさ作成' },
              { text: '第二階層アクセス権限者登録（22フォルダ)' },
              { text: '削除' }
            ]
          }
        ]
      }
    ]
  },
  {
    text: '受発注管理システム',
    rowIndex: 6,
    style: { background: config.Colors.grey1 },
    children: [
      {
        text: '物件登録',
        rowIndex: 6,
        style: { background: config.Colors.grey1 },
        children: [
          {
            component: CellComponent.LIST_CHECKBOX,
            rowIndex: 6,
            items: [
              { text: '物件コード' },
              { text: '物件名' },
              { text: '物件' },
              { text: '管理所属コード' },
              { text: 'マンションコード' },
              { text: '郵便番号' },
              { text: '住所・所在地' },
              { text: '納戸数' },
              { text: '削除' }
            ]
          }
        ]
      }
    ]
  }
]
const PropertyMasterRegistration = {
  caption: '物件マスタ登録申請票',
  tables: [
    {
      headers: [
        {
          text: '必須項目入力欄',
          colspan: 3,
          style: { background: config.Colors.grey1 }
        }
      ],
      rows: drawTable(params0)
    },
    {
      className: 'mb-5',
      headers: [
        {
          text: '申請区分',
          colspan: 3,
          style: { background: config.Colors.grey1 }
        }
      ],
      rows: drawTable(radios)
    },
    {
      headers: [
        {
          text: '該当項目入力欄',
          colspan: 3,
          style: { background: config.Colors.grey1 }
        }
      ],
      rows: [
        rowIndexStatus(1, '物件コード', '変更・解約'),
        rowIndexStatus(2, '物件名称', '新規・変更・解約'),
        rowIndexStatus(3, '物件け', '新規'),
        rowIndexStatus(4, '物件通称', '新規'),
        rowIndexStatus(5, '担当部署', '新規・変更・解約', true),
        rowIndexStatus(6, '担当部署(旧)', '新規・変更・解約', true),
        rowIndexStatus(7, '会計年度開始月', '新規・変更・解約', true),
        rowIndexStatus(8, '管理開始日', '新規・変更・解約', true),
        rowIndexStatus(9, '管理終了日', '新規・変更・解約', true),
        rowIndexStatus(
          10,
          '<div class="d-inline-flex flex-gap-4">物件 <br/> 住所 <div> 郵便番号<br/> 物件 都道府県 <br/> それ以降 <br/>＊市区町村以降</div></div>',
          '新規',
          true
        ),
        rowIndexStatusRadios(11, '管理', '新規', [
          { text: 'マンション', value: 'マンション' },
          { text: 'ビル・施設', value: 'ビル・施設' },
          { text: '戸建', value: '戸建' },
          { text: '定期契約外', value: '定期契約外' }
        ]),
        rowIndexStatusRadios(12, '仲介重説申込', '新規', [
          { text: '対象', value: '対象' },
          { text: '対象外', value: '対象外' }
        ]),
        rowIndexStatus(13, '担当課長', '新規・変更・解約'),
        rowIndexStatus(14, '担当課長(旧)', '変更'),
        rowIndexStatus(15, 'フロント担当者', '新規・変更・解約'),
        rowIndexStatus(16, 'フロント担当者(旧)', '変更'),
        rowIndexStatusRadios(17, '棟の有無', '新規', [
          { text: 'あり', value: 'あり' },
          { text: 'なし', value: 'なし' }
        ]),
        rowIndexStatusRadios(18, '関連組合の有無', '新規', [
          { text: 'あり', value: 'あり' },
          { text: 'なし', value: 'なし' }
        ])
      ]
    },
    {
      note: `【注意事項】<br/>
      1.おで囲われた部分を入力してください。<br/>
      2. <span class='primary-text'> 複数の物件で担当者に変更がある場合は、「ローレルコート近鉄ほか5件」といったように物件名称に入力し、<br/>
      <u>代表物件名のほかに何件あるのか</u>を明確にしてください。<br/>
      また、その代表物件を含む全ての物件については、別Sheetの<b>「担当者変更リスト」</b>に入力してください。<br/> </span>
      3. <span class='txt-red-2'>OA担当者が入力後、「名前を付けて保存」でファイル名を<b><u>申物番号:JB大阪北20200101)</u><b/> に変更のうえ、<br/>
      <br/> <br/>
      メールに添付して経営企画部(担当: )宛てに送信してください。<br/>
      ※メールの件名は「マスタ登録申請」にして送信してください。</span>`
    },
    // {
    //   rows: [rowType1(params1).headers, rowType1(params1).cells]
    // },
    {
      rows: drawTable(params1)
    },
    {
      rows: drawTable(params2)
    }
  ]
}

export default PropertyMasterRegistration
