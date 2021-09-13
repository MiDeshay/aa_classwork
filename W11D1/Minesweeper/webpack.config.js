const path = require('path');

module.exports = { // es5 style
	context: __dirname,
	entry: './react_minesweeper.jsx',
	output: {			// where webpack should output hte bundled files
		path: path.resolve(__dirname),
		// use path.resolve() to resolve our paths into an absolute path.
		// __dirname tells us the absolute path of teh directory containing the currently executing file
		filename: 'bundle.js'
	},
	devtool: 'source-map', // a source map makes it possible for you to see the line numbers of your original source code when errors are raised. ~~~
	resolve: {
		extensions: ['.js', '.jsx', '*']
	},
  module: { // allows you to specify several loaders within our webpack configuration
    rules: [
      {
        test: /\.jsx?$/,
        exclude: /(node_modules)/,
        use: {
          loader: 'babel-loader',
          options: { // 'query:' or 'options:' depending on webpack version read the errrors
            presets: ['@babel/env', '@babel/react']
          }
        }
      }
    ]
  }
}