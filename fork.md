## Index TAR stream from pipe/stdin

Feature request: make `$ cat 200GB.tar | tarindexer -i - indexfile.index` a thing or make it work no-problem.

Motivation: (1) for a multi-part tarball like file.tar.aa, file.tar.ab, file.tar.ac, etc. where each one is 1.8 GB in size (2) because more programs should support processing like `$ cat file | programname -`

At github.com/ProximaNova/tarindexer ( https://github.com/ProximaNova/tarindexer/commit/83ec921d77f6673249a8619b98cc9e3282dcd7d2 ) you can run this and it will work: `$ cat a.tar.1 a.tar.2 | tarindexer -i - indexfile.index`

The main problem is that it only works on piped TAR data which is less than too many megabytes for the memory to handle (so it will use too much RAM if a.tar.* = 20 GB). Further work or research is needed to make it memory safe or memory sensible. Docs: https://docs.python.org/3/library/tarfile.html
