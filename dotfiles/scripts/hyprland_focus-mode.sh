#!/bin/bash

# Simple script to toggle some Hyprland properties.

turn_on() {
    killall waybar
    hyprctl keyword general:gaps_in 0
    hyprctl keyword general:gaps_out 0
    hyprctl keyword decoration:rounding 0
    hyprctl keyword decoration:inactive_opacity 1
    hyprctl keyword decoration:blur false
    hyprctl keyword decoration:drop_shadow false
    hyprctl keyword general:col.active_border "rgb(928374)"
    notify-send -t 3000 "Focus mode ON"
}

turn_off() {
    waybar &
    hyprctl keyword general:gaps_in 3
    hyprctl keyword general:gaps_out 10
    hyprctl keyword decoration:rounding 5
    hyprctl keyword decoration:inactive_opacity 0.8
    hyprctl keyword decoration:blur true
    hyprctl keyword decoration:drop_shadow true
    hyprctl keyword general:col.active_border "rgb(fabd2f) rgb(8ec07c) 45deg"
    notify-send -t 3000 "Focus mode OFF"
}

main() {
    rounding=$(hyprctl getoptions decoration:rounding | rg int | \
        sed -e "s/[[:space:]]int: //")

    # waybar can be toggled but I prefer to kill the process completely to save
    # a little battery, even tough it takes some more milliseconds to start
    #pkill -SIGUSR1 waybar

    if [[ $rounding == 5 ]]; then
        turn_on
    else
        turn_off
    fi
}

main
