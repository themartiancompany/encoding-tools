// SPDX-License-Identifier: AGPL-3.0-or-later

/**    ------------------------------------------------------------------
 *     Copyright ©
 *       Pellegrino Prevete
 *         2024, 2025, 2026
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

let
  _file_name,
  _output,
  _output_dir,
  _path;
_path =
  require(
    'path');
_output_dir =
  _path.resolve(
    __dirname);
_file_name =
  "fs-worker.js";
_output = {
  path:
    _output_dir,
  filename:
    _file_name
}

module.exports = {
  entry:
    './node_modules/crash-js/crash-js/fs-worker',
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
    }
  }
};
