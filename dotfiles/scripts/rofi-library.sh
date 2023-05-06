#!/bin/bash

library="$HOME/vault/library/books" # There are only pdfs, epubs, and djvus in here
cd $library
rofi_theme="-theme ~/.config/rofi/themes/library.rasi"

file=$(
    fd . -tf -e 'pdf' -e 'epub' -e 'djvu' | \
    rofi -dmenu -i -matching normal -p "" $rofi_theme \
)

# Open the file only if it exists
if [[ -e $file ]]; then
    zathura $library/"$file"
    exit 0
fi
exit 1
