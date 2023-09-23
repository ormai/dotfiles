#!/usr/bin/env bash

library="$HOME/vault/library/"
cd $library

rofiTheme="-theme ~/.config/rofi/themes/library.rasi"

file=$(
  fd . -tf -e 'pdf' -e 'epub' -e 'djvu' | \
  rofi -dmenu -i -matching normal -p "" $rofiTheme \
)

# Open the file only if it exists
if [[ -e $file ]]; then
  zathura "$library/$file"
  exit 0
fi

exit 1
