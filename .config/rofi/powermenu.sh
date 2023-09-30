#!/usr/bin/env bash

# This script was adpated from 
# https://github.com/adi1090x/rofi/tree/master/files/powermenu

theme="$XDG_CONFIG_HOME/rofi/themes/power.rasi"

shutdown="" # nf-fa-power_off
reboot="" # nf-fa-refresh
lock="" # nf-cod-lock
suspend="" # nf-fa-moon_o
logout="" # nf-fa-sign_out

options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"
action="$(echo -e "$options" | rofi -theme $theme -p -dmenu -selected-row 1)"

case $action in
  $shutdown)
    shutdown now
    ;;
  $reboot)
    systemctl reboot
    ;;
  $lock)
    lock.sh
    ;;
  $suspend)
    systemctl suspend
    ;;
  $logout)
    hyprctl dispatch exit
    ;;
esac
