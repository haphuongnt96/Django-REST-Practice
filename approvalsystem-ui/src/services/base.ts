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
    // const token = store.getters[AuthS.extGetToken]
    // if (token) {
    //   config.headers = { Authorization: `Bearer ${token}` }
    // }
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
  (e) => {
    return Promise.reject(e)
  }
)

export default service
