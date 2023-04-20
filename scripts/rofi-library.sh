#!/bin/bash
# The commented script is slow so I am rewriting it

library="$HOME/vault/library/books" # There are only pdfs, epubs, and djvus in here
cd $library
theme="-theme ~/.config/rofi/themes/library.rasi"

file=$(
  fd . -tf -e 'pdf' -e 'epub' -e 'djvu' | \
  rofi -dmenu -i -matching fuzzy -p "" $theme \
)

if [[ $file ]]; then
  if [[ $file == *.epub ]]; then
    # Terminal ebook reader
    # https://github.com/wustho/epy
    $TERM epy $library/"$file"
    exit 0
  else
    zathura $library/"$file"
  fi
fi
exit 1
