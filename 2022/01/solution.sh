#!/usr/bin/env bash

# Note: written using bash on a mac (3.2.57), ie. no arrays :P

max=0
sums=''
blocks=$(sed 's/^$/;/' ./input.txt)

OLDIFS=$IFS; IFS=';'
for block in ${blocks#}; do
  block_sum=$(echo $(echo $block | sed -E 's/(.)$/\1 +/' | tr '\n' ' ') "0" | bc)
  sums="$L $block_sum"
  if [[ $block_sum -gt $max ]]; then
    max=$block_sum
  fi
done
IFS=$OLDIFS

top_three=$(echo $(echo $sums | tr ' ' '\n' | sort -nr -t ' ' | head -3 | sed -E 's/(.)$/\1 +/') "0" | bc)

echo "Part 1: $max"
echo "Part 2: $top_three"

exit

# First attempt at Part 1 used less memory but cached all blocks in temp files.
split -p "^$" ./input.txt /tmp/aoc1-chunk-

max=0

for chunk in /tmp/aoc1-chunk-*; do
  block_sum=$(echo $(sed -E 's/(.)$/\1 +/' $chunk) "0" | bc)
  if [[ $block_sum -gt $max ]]; then
    max=$block_sum
  fi
done
echo $max
