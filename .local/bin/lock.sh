#!/usr/bin/env bash

TRANSPARENT=00000000
BG="282828"
BG2="3C3836"
RING="3EC07C"
TEXT="1d2021"
ACCENT="B8BB26"
RED="FB4934"
YELLOW="FABD2F"
GREEN="B8BB26"
RANDOM_WP=$( \ls ~/Pictures/wp/light | sort -R | tail -1 )

/usr/bin/swaylock \
  --daemonize \
  --image ~/Pictures/wp/light/$RANDOM_WP \
  --ignore-empty-password \
  --show-failed-attempts \
  --font "Inter" \
  --font-size 20 \
  --indicator-radius 200 \
  --indicator-thickness 10 \
  --inside-color $TRANSPARENT \
  --inside-clear-color $TRANSPARENT \
  --inside-ver-color $TRANSPARENT \
  --inside-wrong-color $TRANSPARENT \
  --ring-color $TRANSPARENT \
  --ring-clear-color $TRANSPARENT \
  --ring-ver-color $TRANSPARENT \
  --ring-wrong-color $TRANSPARENT \
  --line-color $TRANSPARENT \
  --line-clear-color $TRANSPARENT \
  --line-wrong-color $TRANSPARENT \
  --line-ver-color $TRANSPARENT \
  --separator-color $TRANSPARENT \
  --key-hl-color $ACCENT \
  --text-color $TEXT \
  --text-clear-color $TEXT \
  --text-ver-color $TEXT \
  --text-wrong-color $RED
