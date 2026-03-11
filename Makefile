# SPDX-License-Identifier: AGPL-3.0-or-later

#    ----------------------------------------------------------------------
#    Copyright © 2024, 2025, 2026  Pellegrino Prevete
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
MAN_DIR?=$(DESTDIR)$(PREFIX)/share/man

DOC_FILES=\
  $(wildcard *.rst) \
  $(wildcard *.md)

SCRIPT_FILES=$(wildcard $(_PROJECT)/bash/*)

_INSTALL_FILE=\
  install \
    -vDm644
_INSTALL_EXE=\
  install \
    -vDm755
_INSTALL_DIR=\
  install \
    -vdm755

all:

check: shellcheck

shellcheck:

	shellcheck \
	  -s \
	    "bash" \
	  $(SCRIPT_FILES)

install: install-scripts install-doc install-man

build-npm:

	make \
	  build-man
	cp \
	  -r \
	  $(NPM_FILES) \
	  "build"; \
	cd \
	  "build"; \
	_version="$$( \
	  npm \
	    view \
	      "$$(pwd)" \
	      "version")"; \
	npm \
	  install; \
	npm \
	  run \
	    "build"; \
	npm \
	  pack; \
	mv \
	  "$(_PROJECT)-$${_version}.tgz" \
	  ".."

install-doc:

	$(INSTALL_FILE) \
	  $(DOC_FILES) \
	  -t \
	  $(DOC_DIR)

install-scripts:

	$(_INSTALL_DIR) \
	  "$(BIN_DIR)"
	$(_INSTALL_EXE) \
	  "$(_PROJECT)/bash/bin2txt" \
	  "$(BIN_DIR)"
	$(_INSTALL_EXE) \
	  "$(_PROJECT)/bash/txt2bin" \
	  "$(BIN_DIR)"

install-man:

	$(INSTALL_DIR) \
	  "$(MAN_DIR)/man1"
	rst2man \
	  "man/bin2txt.1.rst" \
	  "$(MAN_DIR)/man1/bin2txt.1"
	rst2man \
	  "man/txt2bin.1.rst" \
	  "$(MAN_DIR)/man1/txt2bin.1"

.PHONY: check build-npm install install-doc install-man install-scripts shellcheck
