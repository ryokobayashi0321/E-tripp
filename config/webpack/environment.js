const { environment } = require('@rails/webpacker')

// jQuery を Bootstrap 以外で使用
const webpack = require('webpack')
environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
}))

module.exports = environment
