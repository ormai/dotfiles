#!/usr/bin/env bash

get_artist() {
  echo "$(playerctl -p spotify metadata --format "{{ artist }}"| sed -e "s/[[(]....*[])]*//g" | sed "s/ *$//"| sed "s/^\(.\{20\}[^ ]*\)\(.*\)$/\1[\2]/"| sed "s/\[ *\]$//"| sed "s/\[.*\]$/.../")"
} #

get_title() {
  echo "$(playerctl -p spotify metadata --format "{{title}}"|sed 's/'\'\''/'\"'/g' )"
} #

if [[ ! -z "$(playerctl -p spotify status 2>/dev/null)" ]]
then
  artist=$(get_artist) \
  title=$(get_title) \
  (echo "$artist -" "$title")
else
  exit 1
fi
