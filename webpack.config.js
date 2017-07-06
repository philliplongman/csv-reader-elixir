const path = require('path');
const webpack = require('webpack');
const UglifyJSPlugin = require('uglifyjs-webpack-plugin');
const ExtractTextPlugin = require("extract-text-webpack-plugin");
const CopyWebpackPlugin = require('copy-webpack-plugin');

module.exports = {
  entry: [
    path.resolve(__dirname, "./web/static/css/app.css"),
    path.resolve(__dirname, "./web/static/js/app.js")
  ],
  output: {
    path: path.resolve(__dirname, "./priv/static/js"),
    filename: "app.bundle.js"
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        use: [{
          loader: "babel-loader",
          options: {
            ignore: "/node_modules/",
            presets: ["es2015"]
          },
        }],
      },
      {
        test: /\.css$/,
        use: ExtractTextPlugin.extract({
          fallback: "style-loader",
          use: "css-loader"
        })
      }
    ],
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: '"production"'
      }
    }),
    new webpack.optimize.UglifyJsPlugin(),
    new ExtractTextPlugin("../css/app.bundle.css"),
    new CopyWebpackPlugin([{ from: './web/static/assets/', to: '../' }])
  ],
  resolve: {
    alias: { "vue$": "vue/dist/vue.esm.js" }
  }
};
