import config from '@/common/config'
import {
  rowIndexStatus,
  rowIndexStatusRadios,
  rowType1
} from '@/modules/form/helpers'
import { VCheckbox } from 'vuetify/lib'

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
      rows: [
        [
          {
            text: '申請番号',
            colspan: 2,
            style: { background: config.Colors.grey1 }
          },
          {
            text: ''
          }
        ],
        [
          {
            text: '申請日',
            colspan: 2,
            style: { background: config.Colors.grey1 }
          },
          {
            text: ''
          }
        ],
        [
          {
            text: '申請日',
            colspan: 2,
            style: { background: config.Colors.grey1 }
          },
          {
            text: ''
          }
        ],
        [
          {
            text: '申請者 (OA担当者)',
            rowspan: 2,
            style: { background: config.Colors.grey1 }
          },
          {
            text: '所属部署'
          },
          {
            text: 'リストから選択',
            style: {
              background: config.Colors.pink3,
              color: config.Colors.red1
            }
          }
        ],
        [{ text: '氏名', background: config.Colors.grey1 }, { text: '' }]
      ]
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
      rows: [
        [
          {
            component: VCheckbox,
            text: '申請番号'
          },
          {
            text: '新規・リプレイスにより新規登録する場合',
            style: { background: config.Colors.grey1 }
          }
        ],
        [
          {
            component: VCheckbox,
            text: '変更'
          },
          {
            text: '登録内容の変更をする場合',
            style: { background: config.Colors.grey1 }
          }
        ],
        [
          {
            component: VCheckbox,
            text: '解約'
          },
          {
            text: '管理解約になった場合',
            style: { background: config.Colors.grey1 }
          }
        ]
      ]
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
        rowIndexStatus('物件コード', '変更・解約'),
        rowIndexStatus('物件名称', '新規・変更・解約'),
        rowIndexStatus('物件け', '新規'),
        rowIndexStatus('物件通称', '新規'),
        rowIndexStatus('担当部署', '新規・変更・解約', true),

        rowIndexStatus('担当部署(旧)', '新規・変更・解約', true),
        rowIndexStatus('会計年度開始月', '新規・変更・解約', true),
        rowIndexStatus('管理開始日', '新規・変更・解約', true),
        rowIndexStatus('管理終了日', '新規・変更・解約', true),
        rowIndexStatus(
          '物件 住所 郵便番号 <br/> 物件 都道府県 <br/> それ以降',
          '新規',
          true
        ),
        rowIndexStatusRadios('管理', '新規', [
          { text: 'マンション', value: 'マンション' },
          { text: 'ビル・施設', value: 'ビル・施設' },
          { text: '戸建', value: '戸建' },
          { text: '定期契約外', value: '定期契約外' }
        ]),
        rowIndexStatusRadios('仲介重説申込', '新規', [
          { text: '対象', value: '対象' },
          { text: '対象外', value: '対象外' }
        ]),
        rowIndexStatus('担当課長', '新規・変更・解約'),
        rowIndexStatus('担当課長(旧)', '変更'),
        rowIndexStatus('フロント担当者', '新規・変更・解約'),
        rowIndexStatus('フロント担当者(旧)', '変更'),
        rowIndexStatusRadios('棟の有無', '新規', [
          { text: 'あり', value: 'あり' },
          { text: 'なし', value: 'なし' }
        ]),
        rowIndexStatusRadios('関連組合の有無', '新規', [
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
    {
      rows: [
        rowType1(
          {
            text: '管理部署使用欄',
            rowspan: 2
          },
          [
            {
              text: '登録承認'
            },
            {
              text: '完了承認'
            },
            {
              text: '受託会計部登録'
            },
            {
              text: '経理課登録者'
            },
            {
              text: '登録者'
            }
          ]
        )
      ]
    }
  ]
}

export default PropertyMasterRegistration
