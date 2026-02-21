// SPDX-License-Identifier: AGPL-3.0-or-later

/**    ------------------------------------------------------------------
 *     Copyright ©
 *       Pellegrino Prevete
 *         2025, 2026
 * 
 *     All rights reserved
 *     ------------------------------------------------------------------
 * 
 *     This program is free software: you can redistribute it and/or
 *     modify it under the terms of the GNU General Public License as
 *     published by the Free Software Foundation, either version 3 of
 *     the License, or (at your option) any later version.
 * 
 *     This program is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *     GNU General Public License for more details.
 * 
 *     You should have received a copy of the GNU General Public License
 *     along with this program.
 *     If not, see <https://www.gnu.org/licenses/>.
 */


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
