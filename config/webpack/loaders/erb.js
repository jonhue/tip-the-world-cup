module.exports = {
  test: /\.erb$/,
  enforce: 'pre',
  exclude: /node_modules/,
  use: [{
    loader: 'rails-erb-loader',
    options: {
      runner: (process.env.NODE_ENV == 'development' ? 'ruby ' : '') + 'bin/rails runner'
    }
  }]
}
