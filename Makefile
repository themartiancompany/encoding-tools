# SPDX-License-Identifier: AGPL-3.0-or-later

#    ----------------------------------------------------------------------
#    Copyright © 2024, 2025  Pellegrino Prevete
#
#    All rights reserved
#    ----------------------------------------------------------------------
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

_PROJECT=encoding-tools
PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
DATA_DIR=$(DESTDIR)$(PREFIX)/share/$(_PROJECT)

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard $(_PROJECT)/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-scripts install-doc

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-scripts:

	install -vdm 755 "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/bin2txt "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/txt2bin "$(BIN_DIR)"

.PHONY: check install install-doc install-scripts shellcheck
