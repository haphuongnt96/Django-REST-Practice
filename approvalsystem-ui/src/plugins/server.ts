import { createServer, Factory, Model } from 'miragejs'
/* eslint @typescript-eslint/no-var-requires: "off" */
const faker = require('faker')

export function makeServer({ environment = 'development' } = {}) {
  const server = createServer({
    environment,

    models: {
      user: Model,
      approval_route: Model
    },

    factories: {
      user: Factory.extend({
        name: faker.name.firstName(),
        surname: faker.name.lastName(),
        email: faker.internet.email(),
        thumbnail: faker.image.avatar()
      }),
      approval_route: Factory.extend({
        name: '1',
        approval_route_id: '',
        approval_type_cd: '',
        judgement_cd: '',
        request_emp_cd: '',
        request_emp_fullname: '申請者'
      })
    },

    seeds(server) {
      for (const i in [...Array(50).keys()]) {
        server.create('user', {
          name: faker.name.firstName(),
          surname: faker.name.lastName(),
          email: faker.internet.email(),
          thumbnail: faker.image.avatar(),
          index: i
        })
      }
      for (const i in [...Array(10).keys()]) {
        server.create('approval_route', {
          name: '1',
          approval_route_id: i,
          approval_type_cd: '',
          judgement_cd: '',
          request_emp_cd: '',
          request_emp_fullname: '武田 信玄',
          approval_route_details: [
            {
              approval_route_id: '',
              detail_no: 0,
              approval_post_nm: '大阪北支店 課長',
              required_num_approvals: 0,
              order: 0,
              notification: '',
              approval_post_cd: '',
              approval_emp_id: 0,
              approval_emp_nm: '山田 太郎',
              approval_status: false,
              approval_date: Date.now()
            },
            {
              approval_route_id: '',
              detail_no: 0,
              approval_post_nm: '大阪北支店 課長1',
              required_num_approvals: 0,
              order: 0,
              notification: '',
              approval_post_cd: '',
              approval_emp_id: 0,
              approval_emp_nm: '山田 太郎',
              approval_status: false,
              approval_date: Date.now()
            },
            {
              approval_route_id: '',
              detail_no: 0,
              approval_post_nm: '大阪北支店 課長2',
              required_num_approvals: 0,
              order: 0,
              notification: '',
              approval_post_cd: '',
              approval_emp_id: 0,
              approval_emp_nm: '山田 太郎',
              approval_status: false,
              approval_date: Date.now()
            },
            {
              approval_route_id: '',
              detail_no: 0,
              approval_post_nm: '大阪北支店 課長3',
              required_num_approvals: 0,
              order: 0,
              notification: '',
              approval_post_cd: '',
              approval_emp_id: 0,
              approval_emp_nm: '山田 太郎',
              approval_status: false,
              approval_date: Date.now()
            },
            {
              approval_route_id: '',
              detail_no: 0,
              approval_post_nm: '大阪北支店 課長4',
              required_num_approvals: 0,
              order: 0,
              notification: '',
              approval_post_cd: '',
              approval_emp_id: 0,
              approval_emp_nm: '山田 太郎',
              approval_status: false,
              approval_date: Date.now()
            },
            {
              approval_route_id: '',
              detail_no: 0,
              approval_post_nm: '大阪北支店 課長',
              required_num_approvals: 0,
              order: 0,
              notification: '',
              approval_post_cd: '',
              approval_emp_id: 0,
              approval_emp_nm: '武藤 敬司',
              approval_status: false,
              approval_date: Date.now()
            },
            {
              approval_route_id: '',
              detail_no: 0,
              approval_post_nm: '大阪北支店 課長',
              required_num_approvals: 0,
              order: 0,
              notification: '',
              approval_post_cd: '',
              approval_emp_id: 0,
              approval_emp_nm: '蝶野 正洋',
              approval_status: false,
              approval_date: Date.now()
            },
            {
              approval_route_id: '',
              detail_no: 0,
              approval_post_nm: '大阪北支店 支店長',
              required_num_approvals: 0,
              order: 0,
              notification: '',
              approval_post_cd: '',
              approval_emp_id: 0,
              approval_emp_nm: '蝶野 正洋',
              approval_status: true,
              approval_date: Date.now()
            }
          ]
        })
      }
    },

    routes() {
      this.urlPrefix = process.env.VUE_APP_BACKEND_URL
      this.get('/api/requests/:id/approval_routes', (schema) => {
        return schema.db.approvalRoutes
      })

      this.passthrough()
    }
  })
  return server
}

// if (process.env.VUE_APP_ENV === 'development') {
//   makeServer()
// }
