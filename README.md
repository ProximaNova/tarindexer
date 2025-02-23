tarindexer
==========

python module for indexing tar files for fast access

Usage:

create index file (set offset to 0 for normal TAR files):

    tarindexer -i tarfile.tar indexfile.index 0

lookup file using indexfile (prints file to stdout):

    tarindexer -l tarfile.tar indexfile.index lookuppath
