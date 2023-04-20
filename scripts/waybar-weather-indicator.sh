#!/bin/sh

temp=$( curl --no-progress-meter "https://www.3bmeteo.com/meteo/luzzi"  | sed -n "/tattuale/p" | sed -e "s/ 'tattuale': '//" | sed -e "s/[[']....*[]']*//g")
weatherCondition=$(curl --no-progress-meter "wttr.in/Luzzi?format=%c\n" | sed -e "s/ //g")
sunrise=$(curl --no-progress-meter "wttr.in/Luzzi?format=%S\n" | sed -e "s/://g")
dusk=$(curl --no-progress-meter "wttr.in/Luzzi?format=%d\n" | sed -e "s/://g")
currentTime=$(date +%T | sed -e "s/://g")

if [[ $currentTime > $sunrise && $currentTime < $dusk ]] 
then
  # DAY
  case $weatherCondition in
    ☀️) icon="盛";;
    🌩) icon="";;
    🌦) icon="";;
    ⛅️) icon="";;
    ☁️) icon="摒";;
    🌫) icon="";;
    🌧) icon="歹";;
    ❄️) icon="";;
  esac
else
  # NIGHT
  case $weatherCondition in
    ☀️) icon="望";;
    🌩) icon="";;
    🌦) icon="";;
    ⛅️) icon="";;
    ☁️) icon="摒";;
    🌫) icon="";;
    🌧) icon="歹";;
    ❄️) icon="";;
  esac
fi

echo "$temp°C $icon"
