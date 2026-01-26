const
  _path =
    require(
      'path');
const
  _output_dir =
    _path.resolve(
      __dirname);
const
  _file_name =
    "ahsi.js";
const
  _output = {
    path:
      _output_dir,
    filename:
      _file_name
};
const
  _yargs_ignore = {
    resourceRegExp:
      /^yargs$/
}
const
  _yargs_helpers_ignore = {
    resourceRegExp:
      /^yargs\/helpers$/
}
const
  _webpack =
    require(
     "webpack");
const
  _ignore_plugin =
    _webpack.IgnorePlugin; 
const
  _yargs_ignore_plugin =
    new _ignore_plugin(
          _yargs_ignore);
const
  _yargs_helpers_ignore_plugin =
    new _ignore_plugin(
          _yargs_helpers_ignore);
module.exports = {
  entry:
    './ahsi',
  output:
    _output,
  optimization: {
    moduleIds: 'deterministic',
  },
  resolve: {
    fallback: {
      "fs":
        false,
      "happy-opfs":
        _path.resolve(
          __dirname,
          'node_modules/happy-opfs/dist/main.mjs'),
      "path":
        false,
      "@std/path":
        _path.resolve(
          __dirname,
          'node_modules/@std/path/mod.js'),
      "fs-worker":
        _path.resolve(
          __dirname,
          'node_modules/crash-bash/crash/bash/fs-worker'),
      "yargs":
        false,
      "yargs/helpers":
        false
    },
  },
  externals:
    { yargs: 'yargs' },
  plugins: [
    _yargs_ignore_plugin,
    _yargs_helpers_ignore_plugin
  ]
};
