/* eslint-disable */
const CompressionPlugin = require('compression-webpack-plugin')
const SpeedMeasurePlugin = require('speed-measure-webpack-plugin')
const os = require('os')

const IS_PROD = ['production', 'prod'].includes(process.env.NODE_ENV)
const IS_DEV = ['development'].includes(process.env.NODE_ENV)

module.exports = {
  chainWebpack(config) {
    config.module
    config.plugin('speed-measure-webpack-plugin').use(SpeedMeasurePlugin),
      config.plugin('fork-ts-checker').tap((args) => {
        let totalmem = Math.floor(os.totalmem() / 1024 / 1024) //get OS mem size
        let allowUseMem = totalmem > 12288 ? 6144 : 1000
        args[0].measureCompilationTime = true
        // in vue-cli shuld args[0]['typescript'].memoryLimit
        args[0].memoryLimit = allowUseMem
        // args[0].workers = ForkTsCheckerWebpackPlugin.TWO_CPUS_FREE;
        args[0].useTypescriptIncrementalApi = true
        // console.log(args);
        return args
      })
    if (IS_PROD) {
      config.plugin('CompressionPlugin').use(CompressionPlugin)
    }
  },
  configureWebpack: (config) => {
    // Avoid Extra optimization steps
    // https://webpack.js.org/guides/build-performance/#avoid-extra-optimization-steps
    if (IS_DEV) {
      ; (config.optimization = {
        runtimeChunk: true,
        removeAvailableModules: false,
        removeEmptyChunks: false,
        splitChunks: false
      }),
        (output = {
          pathinfo: false
        })
    }
  },
  productionSourceMap: false,
  transpileDependencies: ['vuetify'],
  parallel: require('os').cpus().length > 1
}
