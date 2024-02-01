#!/usr/bin/env bash

DIR="$HOME/"
cd "$DIR" || exit

FILE=$(fd . -tf -e 'pdf' -e 'epub' -e 'djvu' | rofi -dmenu -i -matching normal -p "󱉟" -theme ~/.config/rofi/themes/library.rasi)

if [[ -e $FILE ]]
then xdg-open "$DIR/$FILE"
fi
