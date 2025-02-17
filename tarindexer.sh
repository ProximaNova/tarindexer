#!/bin/bash
# Usage: ./thisscript $tarfile $index $offset $count
# This writes a couple duplicate lines, but whatever. Tar header contains the text "ustar"
# Tar header: 100 B file name + 8 bytes + 8 B + 8 B + 12 + 12 + 8 + 1 + 1 = 158 B
# Tar header is 512 bytes long, and ustar is seen 257 bytes into it.
# ustar might be in the first n bytes: "$ cat file.tar.ab | head -c2890111 | grep -boa ustar"
# = 1326849:ustar = subtract 257 then run "$ ./tarindexer.sh file.tar.ab index.txt 1326592 4"

n=$(expr $3 + 1)
tail -c+$n "$1" | head -c19000111 | ./tarindexer.edit.py -i - "$2" $3

i=1; while [ $i -lt $4 ]; do
    next=$(expr $(tail -n1 "$2" | perl -pE "s/.* (\d+) \d+$/\1/g") - 512); n=$(expr $next + 1)
    echo $n $next
#    tail -c+$n "$1" | pv -L 9002111 | head -c19000111 | ./tarindexer.edit.py -i - "$2" $next
    tail -c+$n "$1" | head -c19000111 | ./tarindexer.edit.py -i - "$2" $next
    i=$(expr $i + 1)
done
