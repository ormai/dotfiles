#!/bin/sh

# This script was adpated from
# https://github.com/adi1090x/rofi/tree/master/files/powermenu

THEME="$XDG_CONFIG_HOME/rofi/themes/power.rasi"

SHUTDOWN="" # nf-fa-power_off
REBOOT="" # nf-fa-refresh
LOCK="" # nf-cod-lock
SUSPEND="" # nf-fa-moon_o
LOGOUT="" # nf-fa-sign_out

case $(printf '%s\n%s\n%s\n%s\n%s' $SHUTDOWN $REBOOT $LOCK $SUSPEND $LOGOUT\
         | rofi -theme "$THEME" -dmenu -selected-row 3) in
  "$SHUTDOWN") shutdown now ;;
  "$REBOOT") systemctl reboot ;;
  "$LOCK") lock.sh ;;
  "$SUSPEND") systemctl suspend ;;
  "$LOGOUT") swaymsg exit ;;
esac
