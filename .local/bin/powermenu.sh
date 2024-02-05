#!/bin/sh

# This script was adpated from
# https://github.com/adi1090x/rofi/tree/master/files/powermenu

SHUTDOWN="" # nf-fa-power_off
REBOOT="" # nf-fa-refresh
LOCK="" # nf-cod-lock
SUSPEND="" # nf-fa-moon_o
LOGOUT="" # nf-fa-sign_out

CHOICE=$(printf '%s\n%s\n%s\n%s\n%s' $SHUTDOWN $REBOOT $LOCK $SUSPEND $LOGOUT \
  | rofi -dmenu -selected-row 3 -theme-str "window { height: 264; width: 60; location: west; x-offset: 50; } mainbox { children: [ listview ]; } element-text { padding: 2 0 2 -3; font: \"JetBrainsMono Nerd Font 16\"; } element-text selected { text-color: @red; }")

case "$CHOICE" in
  "$SHUTDOWN") shutdown now ;;
  "$REBOOT") systemctl reboot ;;
  "$LOCK") lock.sh ;;
  "$SUSPEND") systemctl suspend ;;
  "$LOGOUT") swaymsg exit ;;
esac
