const { environment } = require('@rails/webpacker')
const erb =  require('./loaders/erb')

environment.loaders.append('erb', erb)
environment.loaders.get('sass').use.find(item => item.loader === 'sass-loader').options.includePaths = ['node_modules']
module.exports = environment
