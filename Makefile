# SPDX-License-Identifier: AGPL-3.0-or-later

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
