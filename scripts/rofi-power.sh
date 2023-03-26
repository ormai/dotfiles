#!/usr/bin/sh

# This script is adpated from 
# https://github.com/adi1090x/rofi/tree/master/files/powermenu

theme="$XDG_CONFIG_HOME/rofi/themes/power.rasi"
confirm_theme="$XDG_CONFIG_HOME/rofi/themes/power-confirm.rasi"

shutdown=""
reboot=""
lock=""
suspend=""
logout=""

options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"
action="$(echo -e "$options" | rofi -theme $theme -p -dmenu -selected-row 1)"

confirm_exit() 
{
  yn="Y\nN"
  echo -e $yn | rofi -dmenu -p "Confirm?" -theme $confirm_theme -selected-row 1
}

case $action in
  $shutdown)
    [[ $(confirm_exit &) == "Y" ]] && shutdown now || exit 0
    ;;
  $reboot)
    [[ $(confirm_exit &) == "Y" ]] && systemctl reboot || exit 0
    ;;
  $lock)
    lock.sh
    ;;
  $suspend)
    [[ $(confirm_exit &) == "Y" ]] && systemctl suspend || \
    exit 0
    ;;
  $logout)
  [[ $(confirm_exit &)$ == "Y" ]] && hyprctl dispatch exit || \
    exit 0
    ;;
esac
