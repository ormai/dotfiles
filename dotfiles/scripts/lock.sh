#!/bin/sh

TRANSPARENT=00000000
BG="282828"
BG2="3C3836"
RING="3EC07C"
TEXT="EBDBB2"
ACCENT="D65D0E"
RED="FB4934"
YELLOW="FABD2F"
GREEN="B8BB26"
RANDOM_WP=$( \ls ~/Pictures/wp/light | sort -R | tail -1 )

swaylock \
  --daemonize \
  --image ~/Pictures/wp/light/$RANDOM_WP \
  --ignore-empty-password \
  --show-failed-attempts \
  --font "Inconsolata Nerd Font" \
  --font-size 30 \
  --indicator-radius 200 \
  --indicator-thickness 10 \
  --inside-color $TRANSPARENT \
  --inside-clear-color $BG \
  --inside-ver-color $BG \
  --inside-wrong-color $BG \
  --ring-color $RING \
  --ring-clear-color $YELLOW \
  --ring-ver-color $GREEN \
  --ring-wrong-color $RED \
  --line-color $BG2 \
  --line-clear-color $BG2 \
  --line-wrong-color $BG2 \
  --line-ver-color $BG2 \
  --separator-color $BG2 \
  --key-hl-color $ACCENT \
  --text-color $TEXT \
  --text-clear-color $TEXT \
  --text-ver-color $TEXT \
  --text-wrong-color $RED
