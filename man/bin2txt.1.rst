==============
bin2txt
==============

--------------------------------------------------------
Binary To Text
--------------------------------------------------------
:Version: bin2txt |version|
:Manual section: 1

Synopsis
========

bin2txt *[options]* *in_file* *out_txt_prefix*

Description
===========

Converts binary to ascii text.

Options
========

-f encoding_format      Encoding format ('base64').
-B buffer_size          Size in bytes the input file will
                        be split before being read
   		        in memory and passed to
   		        the encoder.
-L string_length        String chunk length.
-s                      Only print chunks amount.

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

* base64
* txt2bin

.. include:: variables.rst
