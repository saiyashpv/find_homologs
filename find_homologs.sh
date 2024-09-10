#!/bin/bash

blastn -query "$1" -subject "$2" -task blastn-short -outfmt '6 std sseq qlen' > "$3"
awk '$3 == 100.00 && $4 == $14' "$3" > "temp.txt"
mv temp.txt "$3"
num_matches=$(wc -l < "$3")
echo "$num_matches perfect matches found"