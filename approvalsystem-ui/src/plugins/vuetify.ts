import Vue from 'vue'
import Vuetify from 'vuetify/lib'
import { Ripple } from 'vuetify/lib/directives'
import { Iconfont } from 'vuetify/types/services/icons'
import '@mdi/font/css/materialdesignicons.css'
import config from '@/common/config'

const iconfont: Iconfont = 'mdi'
const opts = {
  icons: {
    iconfont
  },

  theme: {
    options: {
      customProperties: true
    },
    dark: false,
    themes: {
      light: {
        primary: '#206fea', // a color that is not in the material colors palette
        secondary: '#6699d5', // a color that is not in the material colors palette
        accent: '#b71c1b',
        white: '#ffffff',
        subtoolbar: '#3b6eb4',
        primaryToolbar: '#315f9a',
        secondaryToolbar: '#4393f9',
        lighty: '#1e1e1e',
        lightyHl: '#000000',
        grey: '#C9CCD5',
        blue2: config.Colors.blue2
      },
      dark: {
        primary: '#206fea', // a color that is not in the material colors palette
        secondary: '#7f8285', // a color that is not in the material colors palette
        accent: '#cc2531',
        white: '#ffffff',
        subtoolbar: '#3b6eb4',
        primaryToolbar: '#315f9a',
        secondaryToolbar: '#4393f9',
        lighty: '#1e1e1e',
        lightyHl: '#000000'
      }
    }
  }
}

Vue.use(Vuetify, {
  directives: {
    Ripple
  }
})

export default new Vuetify(opts)
