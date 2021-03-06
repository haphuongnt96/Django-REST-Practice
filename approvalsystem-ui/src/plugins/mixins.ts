import Vue from 'vue'
import $api from '@/services'
import $pageContents from '@/static/pageContent'
import $config from '@/common/config'
import Toast from '@/plugins/toast'
import CONSTANTS from '@/common/constant'

Vue.mixin({
  computed: {
    $api: () => $api,
    $pageContents: () => $pageContents,
    $config: () => $config,
    $toast: () => Toast,
    $constants: () => CONSTANTS
  }
})
