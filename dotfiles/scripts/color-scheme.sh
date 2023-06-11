#!/bin/bash

# This script gets runned every hour by cronie

function dark {
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    gsettings set org.gnome.desktop.interface gtk-theme Gruvbox-Dark-BL
    notify-send -t 2000 "Dark mode enabled"
}

function light {
    gsettings set org.gnome.desktop.interface gtk-theme Gruvbox-Light
    gsettings set org.gnome.desktop.interface color-scheme prefer-light
    notify-send -t 2000 "Light mode enabled"
}

hour=$(date +%H)

if [[ $hour -lt 19 || $hour -gt 7 ]]; then
    dark
else
    light
fi

