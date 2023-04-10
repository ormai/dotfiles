#!/bin/bash

# Simple script to toggle some Hyprland properties.

turn_on() {
  hyprctl keyword general:gaps_in 0
  hyprctl keyword general:gaps_out 0
  hyprctl keyword decoration:rounding 0
  hyprctl keyword decoration:inactive_opacity 1
  hyprctl keyword general:col.active_border "rgba(fbf9c7ff)"
  hyprctl keyword general:border_size 2
  notify-send -t 3000 "Focus mode ON"
}

turn_off() {
  hyprctl keyword general:gaps_in 3
  hyprctl keyword general:gaps_out 10
  hyprctl keyword decoration:rounding 5
  hyprctl keyword decoration:inactive_opacity 0.95
  hyprctl keyword general:col.active_border "rgba(7c6f64ff)"
  hyprctl keyword general:border_size 1
  notify-send -t 3000 "Focus mode OFF"
}

main() {
  rounding=$(hyprctl getoptions decoration:rounding | rg int | \
    sed -e "s/[[:space:]]int: //")

  pkill -SIGUSR1 waybar # Toggle waybar

  if [[ $rounding == 5 ]]; then
    turn_on
  else
    turn_off
  fi
}

main
