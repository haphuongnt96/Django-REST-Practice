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
      config.headers = { Authorization: `Bearer ${token}` }
    }
    return config
  },
  (error) => {
    // do something with request error
    console.log(error) // for debug
    return Promise.reject(error)
  }
)

// response interceptor
service.interceptors.response.use(
  (response) => {
    return response
  },
  async (err) => {
    const originalConfig = err.config
    console.log(originalConfig)
    console.log(err.response.data)
    if (err.response.status === 401 && !originalConfig._retry) {
      originalConfig._retry = true
      try {
        const rs = await refreshToken()
        const { accessToken } = rs.data.refresh
        localStorage.setItem('vue-token', accessToken)
        // service.defaults.headers.common["x-access-token"] = accessToken
        // service.defaults.headers.common = { Authorization: `Bearer ${accessToken}` }
        return instance(originalConfig)
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
  console.log('rune to refresh')
  return service.post('/api/auth/refresh/', {
    refresh: localStorage.getItem('vue-token-reset')
  })
}
export default service
