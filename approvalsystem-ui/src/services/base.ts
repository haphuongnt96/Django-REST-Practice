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
      //set authorization in headers request
      config.headers['Authorization'] = `Bearer ${token}`
    }
    return config
  },
  (error) => {
    // do something with request error
    return Promise.reject(error)
  }
)
// response interceptor
service.interceptors.response.use(
  (response) => {
    return response.data
  },
  async (err) => {
    const originalConfig = err.config
    const refreshToken = localStorage.getItem('vue-token-reset')
    //check reponse status to refresh accesstoken
    if (err.response.status === 401 && !originalConfig._retry && refreshToken) {
      originalConfig._retry = true
      try {
        //call refreshToken api
        const rs = await axios.post(
          `${process.env.VUE_APP_BACKEND_URL}/api/auth/refresh/`,
          {
            refresh: refreshToken
          }
        )
        if (!rs) {
          //remove token and logout when refresh token expired
          localStorage.removeItem('vue-token')
          localStorage.removeItem('vue-token-reset')
          window.location.href = '/login'
        } else {
          //renew accesstoken
          const refreshToken = rs.data.data.refresh
          const token = rs.data.data.access
          service.defaults.headers.common['Authorization'] = `Bearer ${token}`
          localStorage.setItem('vue-token', token)
          localStorage.setItem('vue-token-reset', refreshToken)
          // service.defaults.headers.common[`Authorization`] = `Bearer ${accessToken}`
          return service(originalConfig)
        }
      } catch (_error) {
        localStorage.removeItem('vue-token')
        localStorage.removeItem('vue-token-reset')
        window.location.href = '/login'
      }
    }
    return Promise.reject(err)
  }
)
export default service
