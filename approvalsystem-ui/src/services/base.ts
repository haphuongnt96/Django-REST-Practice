import axios from 'axios'

export const CancelToken = axios.CancelToken

// create an axios instance
const service = axios.create({
  baseURL: process.env.VUE_APP_BACKEND_URL, // url = base url + request url
  // withCredentials: true, // send cookies when cross-domain requests
  timeout: 5000 // request timeout
})

// request interceptor
service.interceptors.request.use(
  (config) => {
    // do something before request is sent
    const token = localStorage.getItem('vue-token')
    if (token) {
      // config.headers = { Authorization: `Bearer ${token}` }
      config.headers['Authorization'] = `Bearer ${token}`
    }
    return config
  },
  (error) => {
    // do something with request error
    console.log(error) // for debug
    return Promise.reject(error)
  }
)
// service.defaults.headers.common['Authorization'] = '123'
// console.log(service.defaults.headers.common['Authorization'])
// console.log(err.response.data)
// response interceptor
service.interceptors.response.use(
  (response) => {
    return response
  },
  async (err) => {
    const originalConfig = err.config
    console.log(originalConfig)
    if (err.response.status === 401 && !originalConfig._retry) {
      originalConfig._retry = true
      console.log(originalConfig)
      try {
        const rs = await refreshToken()
        console.log(rs)
        if (!rs) {
          localStorage.removeItem('vue-token')
          localStorage.removeItem('vue-token-reset')
          window.location.href = '/login'
        } else {
          console.log('add to token')
          const refreshToken = rs.data.data.refresh
          const token = rs.data.data.access
          service.defaults.headers.common['Authorization'] = `Bearer ${token}`
          localStorage.setItem('vue-token', token)
          localStorage.setItem('vue-token-reset', refreshToken)
          // service.defaults.headers.common[`Authorization`] = `Bearer ${accessToken}`
          return service(originalConfig)
        }
      } catch (_error) {
        if (_error.response && _error.response.data) {
          return Promise.reject(_error.response.data)
        }

        return Promise.reject(_error)
      }
    }
    return Promise.reject(err)
  }
)

function refreshToken() {
  // console.log(localStorage.getItem('vue-token-reset'))
  // axios.post(process.env.VUE_APP_BACKEND_URL + '/api/auth/refresh/', {
  //   refresh: localStorage.getItem('vue-token-reset')
  // })
  return service.post('/api/auth/refresh/', {
    refresh: localStorage.getItem('vue-token-reset')
  })
}
export default service
