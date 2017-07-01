const path = require('path');

module.exports = {
  entry: path.resolve(__dirname, "./web/static/js/app.js"),
  output: {
    path: path.resolve(__dirname, "./priv/static/js"),
    filename: "app.js"
  },
  resolve: {
    alias: { "vue$": "vue/dist/vue.esm.js" }
  }
};
