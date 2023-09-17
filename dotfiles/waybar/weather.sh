#!/usr/bin/sh

TEMP=$(curl -sm 2 "https://www.3bmeteo.com/meteo/luzzi" \
  | rg tattuale | cut -d " " -f 3 | cut -d "'" -f 2)

ICON=$(curl -sm 1 "wttr.in/Luzzi?format=%c\n" \
  | sed -e "s/ //g")

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
