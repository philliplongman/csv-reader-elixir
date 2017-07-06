const path = require('path');
const webpack = require('webpack');
const UglifyJSPlugin = require('uglifyjs-webpack-plugin');
const ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {
  entry: path.resolve(__dirname, "./web/static/js/app.js"),
  output: {
    path: path.resolve(__dirname, "./priv/static/js"),
    filename: "app.js"
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
    new ExtractTextPlugin("app.css")
  ],
  resolve: {
    alias: { "vue$": "vue/dist/vue.esm.js" }
  }
};
