
const path = require('path');
const webpack = require('webpack')
const VENDOR_LIBS = [
  'redux', 'react-redux', 'react-dom'
]

module.exports = {
  entry: {
    firstComp: './src/assets/js/test.js',
    vendor: VENDOR_LIBS
  },
  output: { filename: '[name].js',
            path: path.resolve(__dirname, 'src/public/js/components') },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        options: {
          presets: [
            [ 'es2015', { modules: false } ]
          ]
        }
      }
    ]
  },
  plugins: [
            new webpack.optimize.CommonsChunkPlugin({
                name: 'vendor',
                minChunks: function (module) {
                   // this assumes your vendor imports exist in the node_modules directory
                   return module.context && module.context.indexOf('node_modules') !== -1;
                }
            }),
    //         new webpack.optimize.UglifyJsPlugin({
    //   sourceMap: options.devtool && (options.devtool.indexOf("sourcemap") >= 0 || options.devtool.indexOf("source-map") >= 0)
    // }),
    // new webpack.Define
            // new webpack.optimize.CommonsChunkPlugin({
            //     name: 'manifest' //But since there are no more common modules between them we end up with just the runtime code included in the manifest file
            // })
        ]
};
