#!/bin/bash

ICON=$(curl --no-progress-meter "wttr.in/Luzzi?format=%c\n" \
    | sed -e "s/ //g")

TEMP=$(curl --no-progress-meter "https://www.3bmeteo.com/meteo/luzzi" \
    | rg tattuale | cut -d " " -f 3 | cut -d "'" -f 2)

case $ICON in
    ☀️) icon="sun";;
    🌩) icon="cloud-lightning";;
    🌦) icon="cloud-rain";;
    ⛅️) icon="cloud-sun";;
    ☁️) icon="cloudy";;
    🌫) icon="cloudy";;
    🌧) icon="cloud-hail";;
    ❄️) icon="snowflake";;
esac

echo -e "$HOME/.config/waybar/images/$icon.svg\n$TEMP°C"
