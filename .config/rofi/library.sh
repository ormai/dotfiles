#!/usr/bin/env bash

THEME="-theme ~/.config/rofi/themes/library.rasi"
DIR="$HOME/shelf"
cd $DIR

FILE=$( fd . -tf -e 'pdf' -e 'epub' -e 'djvu' |
  rofi -dmenu -i -matching normal -p "󱉟" $THEME )

if [[ -e $FILE ]]
then zathura "$DIR/$FILE"
fi
