import { Routes } from '@/router'
import $api from '@/services'
import $pageContents from '@/static/pageContent'
import $config from '@/common/config'
import $toast from '@/plugins/toast'
import CONSTANTS from '@/common/constant'
declare module 'vue/types/vue' {
  interface Vue {
    $Routes: typeof Routes
    $api: typeof $api
    $pageContents: typeof $pageContents
    $config: typeof $config
    $toast: typeof $toast
    $constants: typeof CONSTANTS
  }
}
