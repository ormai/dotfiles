#!/bin/sh

# Update colorscheme of running instances of foot
# org.gnome.desktop.interface color-scheme
# <https://codeberg.org/dnkl/foot/wiki#dynamic-color-changes>

COLOR_SCHEME="$(gsettings get org.gnome.desktop.interface color-scheme)"
COLOR_SCHEME=${COLOR_SCHEME#"'prefer-"}
COLOR_SCHEME=${COLOR_SCHEME%"'"}

LIGHT_FOREGROUND=#504945
LIGHT_BACKGROUND=#fafafa
LIGHT_PALETTE="#9d0006 #79740e #b57614 #076678 #8f3f71 #427b58 #504945 #bdae93
               #928374 #9d0006 #79740e #b57614 #076678 #8f3f71 #427b58 #282828"

DARK_BACKGROUND=#1d2021
DARK_FOREGROUND=#ebdbb2
DARK_PALETTE="#3c3836 #cc241d #98971a #d79921 #458588 #b16286 #689d6a #a89984
              #928374 #fb4934 #b8bb26 #fabd2f #83a598 #d3869b #8ec07c #fbf1c7"

set_colors() {
  printf "\033]10;%s\007" "$1" | tee /dev/pts/[0-9]* # foreground
  printf "\033]11;%s\007" "$2" | tee /dev/pts/[0-9]* # background
  #printf "\033]12;%s\007" "$3" | tee /dev/pts/[0-9]* # cursor

  # normal 16 colors
  i=0
  for color in $4
  do
    printf "\033]4;%d;%s\007" $i "$color" | tee /dev/pts/[0-9]*
    i=$((i + 1))
  done
}

if [ "$COLOR_SCHEME" = light ]
then
  set_colors "$LIGHT_FOREGROUND" "$LIGHT_BACKGROUND" "$LIGHT_CURSOR" "$LIGHT_PALETTE"
else
  set_colors "$DARK_FOREGROUND" "$DARK_BACKGROUND" "$DARK_CURSOR" "$DARK_PALETTE"
fi
