#!/bin/sh

temperature=$(curl -s "https://www.3bmeteo.com/meteo/luzzi" |
              grep tattuale | cut -d " " -f 3 | cut -d "'" -f 2)

icon=$(curl -s "wttr.in/Luzzi?format=%c\n" | sed -e "s/ //g")

# Match the icon returned by wttr.in with a svg icon stored in the images dir
case $icon in
  ☀️) icon="sun";;
  🌩) icon="cloud-lightning";;
  🌦) icon="cloud-rain";;
  ⛅️) icon="cloud-sun";;
  ☁️) icon="cloudy";;
  🌫) icon="cloudy";;
  🌧) icon="cloud-hail";;
  ❄️) icon="snowflake";;
esac

printf "%s\n%d°C" "$XDG_CONFIG_HOME/waybar/images/$icon.svg" "$temperature"
