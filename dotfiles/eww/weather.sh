#!/bin/bash

weatherCondition=$(curl --no-progress-meter "wttr.in/Luzzi?format=%c\n" \
    | sed -e "s/ //g")

case $weatherCondition in
    ☀️) icon="sun";;
    🌩) icon="cloud-lightning";;
    🌦) icon="cloud-rain";;
    ⛅️) icon="cloud-sun";;
    ☁️) icon="cloudy";;
    🌫) icon="cloudy";;
    🌧) icon="cloud-hail";;
    ❄️) icon="snowflake";;
esac

echo "./images/weather/$icon.svg"
