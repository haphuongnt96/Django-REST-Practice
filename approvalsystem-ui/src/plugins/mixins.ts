import Vue from 'vue'
import $api from '@/services'
import $pageContents from '@/static/pageContent'
import $config from '@/common/config'

Vue.mixin({
  computed: {
    $api: () => $api,
    $pageContents: () => $pageContents,
    $config: () => $config
  }
})
