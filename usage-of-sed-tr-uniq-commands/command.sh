#/bin/bash
# sed -z 's/\n/ , /g' ./inputs/sample-input.txt | tr " " "\n" | uniq  | tr "\n" " " | sed -z 's/ , /\n/g'
sed -z 's/\n/ , /g' | tr " " "\n" | uniq  | tr "\n" " " | sed -z 's/ , /\n/g'