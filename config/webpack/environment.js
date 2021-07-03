const { environment } = require('@rails/webpacker')

// jQuery を Bootstrap 以外で使用
const webpack = require('webpack')
environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery'
}))

module.exports = environment
