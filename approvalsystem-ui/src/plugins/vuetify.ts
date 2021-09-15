// import Vue from 'vue'
// import Vuetify from 'vuetify/lib'
// import colors from 'vuetify/es5/util/colors'

// // Vue.use(Vuetify, {
// //   iconfont: 'md',
// // });

// Vue.use(Vuetify, {
//   theme: {
//     primary: '#727375', // a color that is not in the material colors palette
//     secondary: '#7f8285', // a color that is not in the material colors palette
//     accent: '#cc2531',
//     info: colors.teal.lighten1,
//     warning: colors.amber.base,
//     error: colors.deepOrange.accent4,
//     success: colors.green.accent3,
//     white: '#ffffff',
//     subtoolbar: '#3b6eb4',
//     primaryToolbar: '#315f9a',
//     secondaryToolbar: '#4393f9'
//   },
//   options: {
//     customProperties: true
//   }
// })

import Vue from 'vue'
// import 'vuetify/dist/vuetify.min.css'
import Vuetify from 'vuetify/lib'
import { Ripple } from 'vuetify/lib/directives'
import { Iconfont } from 'vuetify/types/services/icons'

const navbarBtnActive = '#00cf83'

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
        secondary: '#7f8285', // a color that is not in the material colors palette
        accent: '#b71c1b',
        white: '#ffffff',
        subtoolbar: '#3b6eb4',
        primaryToolbar: '#315f9a',
        secondaryToolbar: '#4393f9',
        lighty: '#1e1e1e',
        lightyHl: '#000000',
        navbarBtnActive,
        esgRed: '#eb513a'
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
        lightyHl: '#000000',
        navbarBtnActive,
        esgRed: '#eb513a'
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
