#!/bin/bash

library="$HOME/vault/library/books" # There are only pdfs, epubs, and djvus in here
cd $library
rofi_theme="-theme ~/.config/rofi/themes/library.rasi"

file=$(
    fd . -tf -e 'pdf' -e 'epub' -e 'djvu' | \
    rofi -dmenu -i -matching normal -p "" $rofi_theme \
)

if [[ $file ]]; then
    if [[ $file == *.epub ]]; then
        # Terminal ebook reader
        # https://github.com/wustho/epy
        $TERM epy $library/"$file"
        exit 0
    else
        zathura $library/"$file"
        exit 0
    fi
fi
exit 1
