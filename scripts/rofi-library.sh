#!/bin/sh
# The commented script is slow so I am rewriting it

library="$HOME/vault/library" # There are only pdfs, epubs, and djvus in here
cd $library
theme="-theme ~/.config/rofi/themes/library.rasi"

file=$( fd . -tf -e 'pdf' -e 'epub' -e 'djvu' | rofi -dmenu -i -matching fuzzy -no-custom -location 0 -p "" $theme )

if [ "$file" ] ; then
  zathura $library/"$file"
  exit 0
fi
exit 1

# #!/usr/bin/env bash
#
# # -----------------------------------------------------------------------------
# # Info:
# #   author:    Miroslav Vidovic
# #   file:      books-search.sh
# #   created:   13.08.2017.-08:06:54
# #   revision:  ---
# #   version:   1.0
# # -----------------------------------------------------------------------------
# # Requirements:
# #   rofi
# # Description:
# #   Use rofi to search my books.
# # Usage:
# #   books-search.sh
# # -----------------------------------------------------------------------------
# # Script:
#
# # Books directory
# BOOKS_DIR=$HOME/vault/library/
#
# # Save find result to F_ARRAY
# readarray -t F_ARRAY <<< "$(/usr/bin/fd . "$BOOKS_DIR" -tf -e 'pdf' -e 'epub' -e 'djvu')"
#
# # Associative array for storing books
# # key => book name
# # value => absolute path to the file
# # BOOKS['filename']='path'
# declare -A BOOKS
#
# # Add elements to BOOKS array
# get_books() {
#
#   # if [ ${#F_ARRAY[@]} != 0 ]; then
#   if [[ ! -z ${F_ARRAY[@]} ]]; then
#     for i in "${!F_ARRAY[@]}"
#     do
#       path=${F_ARRAY[$i]}
#       file=$(basename "${F_ARRAY[$i]}")
#       BOOKS+=(["$file"]="$path")
#     done
#   else
#       echo "I didn't find any book in $BOOKS_DIR is empty!"
#   fi
# }
#
# # List for rofi
# gen_list(){
#   for i in "${!BOOKS[@]}"
#   do
#     echo "$i"
#   done
# }
#
# main() {
#   get_books
#   book=$( (gen_list) | rofi -dmenu -i -matching fuzzy -no-custom -location 0 -p "" -theme ~/.config/rofi/themes/library.rasi )
#
#   if [ -n "$book" ]; then
#     xdg-open "${BOOKS[$book]}"
#   fi
# }
#
# main
#
# exit 0
