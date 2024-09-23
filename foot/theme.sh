#!/bin/sh

# Update colorscheme of running instances of foot
# org.gnome.desktop.interface color-scheme
# <https://codeberg.org/dnkl/foot/wiki#dynamic-color-changes>
#
FG=#504945
BG=#fafafa
PALETTE="#bdae93 #9d0006 #79740e #b57614 #076678 #8f3f71 #427b58 #504945 
         #928374 #9d0006 #79740e #b57614 #076678 #8f3f71 #427b58 #282828"

# BG=#1d2021
# FG=#ebdbb2
# PALETTE="#3c3836 #cc241d #98971a #d79921 #458588 #b16286 #689d6a #a89984
#          #928374 #fb4934 #b8bb26 #fabd2f #83a598 #d3869b #8ec07c #fbf1c7"

printf "\033]10;%s\007" "$FG" | tee /dev/pts/[0-9]* # foreground
printf "\033]11;%s\007" "$BG" | tee /dev/pts/[0-9]* # background
#printf "\033]12;%s\007" "$3" | tee /dev/pts/[0-9]* # cursor

i=0
for color in $PALETTE
do
  printf "\033]4;%d;%s\007" "$i" "$color" | tee /dev/pts/[0-9]*
  i=$((i + 1))
done
