import axios from 'axios'

export const CancelToken = axios.CancelToken

// create an axios instance
// axios のインスタンスを作成　servieceを利用してリクエストすることにより認証を自動で判定更新を行うことができる
const service = axios.create({
  baseURL: process.env.VUE_APP_BACKEND_URL, // url = base url + request url
  // withCredentials: true, // send cookies when cross-domain requests
  // 認証情報あり　//　クロスドメインリクエスト時にcookieを送る
  timeout: 5000 // request timeout
})

// request interceptor
// リクエストが処理される前に行う
service.interceptors.request.use(
  (config) => {
    // do something before request is sent
    // tokenをローカルストレージから取得する
    const token = localStorage.getItem('vue-token')
    if (token) {
      //set authorization in headers request
      // tokenがあれば、リクエストデータのヘッダーにtokenをセットする
      config.headers['Authorization'] = `Bearer ${token}`
    }
    // configを返す
    return config
  },
  (error) => {
    // do something with request error
    // リクエストでエラーが発生した時
    return Promise.reject(error)
  }
)
// response interceptor
// リクエストが処理される前に行う
service.interceptors.response.use(
  (response) => {
    //responseがあった時
    return response
  },
  async (err) => {
    // エラーがあった時の処理
    // orginalConfigをセットする
    const originalConfig = err.config
    // refresh_tokeをローカルストレージから取得する
    const refreshToken = localStorage.getItem('vue-token-reset')
    //check reponse status to refresh accesstoken
    if (err.response.status === 401 && !originalConfig._retry && refreshToken) {
      // エラーが401　かつ　リトライをしていなくて　かつ　refreshutokenがある場合はリトライをTrueにする
      // 短時間期限のtokenが無効で、長時間期限のrefresh_tokenがあれば、それでtokenを再取得を試行する
      originalConfig._retry = true
      try {
        //call refreshToken api
        const rs = await axios.post(
          // 短い時間のtokenを更新リクエストを実施する
          `${process.env.VUE_APP_BACKEND_URL}/api/auth/refresh/`,
          {
            refresh: refreshToken
          }
        )
        if (!rs) {
          //remove token and logout when refresh token expired
          // レスポンスがないのでローカルにあるaccess_token refresh_tokenを削除してログイン画面に遷移させる
          localStorage.removeItem('vue-token')
          localStorage.removeItem('vue-token-reset')
          localStorage.clear()
          window.location.href = '/login'
        } else {
          //renew accesstoken
          // refresh_toke と access_token取得
          const refreshToken = rs.data.data.refresh
          const token = rs.data.data.access
          // リクエストするヘッダーにaccess_tokenをセットする
          service.defaults.headers.common['Authorization'] = `Bearer ${token}`
          // ローカルストレージにaccess_token と refresh_tokenを保存する
          localStorage.setItem('vue-token', token)
          localStorage.setItem('vue-token-reset', refreshToken)
          // service.defaults.headers.common[`Authorization`] = `Bearer ${accessToken}`
          return service(originalConfig)
        }
      } catch (_error) {
        // ローカルストレージにあるaccess_token と refresh_token　を削除してログイン画面に遷移させる
        localStorage.removeItem('vue-token')
        localStorage.removeItem('vue-token-reset')
        localStorage.clear()
        window.location.href = '/login'
      }
    }
    return Promise.reject(err)
  }
)
export default service
