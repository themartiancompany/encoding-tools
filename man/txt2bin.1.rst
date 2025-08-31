==============
txt2bin
==============

--------------------------------------------------------
Text To Binary
--------------------------------------------------------
:Version: txt2bin |version|
:Manual section: 1

Synopsis
========

txt2bin *[options]* *out_file* *[in_txt_files]*

Description
===========

Converts text to binary.

Options
========


-t argument_type        Possible values are 'file' and
                        'list'.
                        When it is 'file' the arguments
                        are the encoded file paths,
                        when it is 'list' the argument is
                        a file containing the paths of the
                        encoded files.
-f encoding_format      Encoding format ('base64').

-h                      Display help.
-c                      Enable color output
-v                      Enable verbose output


Bugs
====

https://github.com/themartiancompany/encoding-tools/-/issues

Copyright
=========

Copyright Pellegrino Prevete. AGPL-3.0.

See also
========

* bin2txt
* base64

.. include:: variables.rst
