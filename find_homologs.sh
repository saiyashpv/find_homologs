#!/bin/bash

tblastn -query "$1" -subject "$2" -outfmt '6 pident length qlen' > "$3"
awk '$1 > 30 && $4 >= (0.9 * $5)' "$3" > "temp.txt"
mv temp.txt "$3"
num_matches=$(wc -l < "$3")
echo "$num_matches perfect matches found"