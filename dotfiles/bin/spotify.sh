#!/usr/bin/sh

function get_artist () {
  echo "$(playerctl -p spotify metadata --format "{{ artist }}"| sed -e "s/[[(]....*[])]*//g" | sed "s/ *$//"| sed "s/^\(.\{20\}[^ ]*\)\(.*\)$/\1[\2]/"| sed "s/\[ *\]$//"| sed "s/\[.*\]$/.../")"
} #

function get_title () {
  echo "$(playerctl -p spotify metadata --format "{{title}}"|sed 's/'\'\''/'\"'/g' )"
} #

[ ! -z "$(playerctl -p spotify status 2>/dev/null)" ] \
  && artist=$(get_artist) \
  && title=$(get_title) \
  && (echo "$artist -" "$title")	|| exit 1
