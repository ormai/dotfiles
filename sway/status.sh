#!/bin/sh

bat() {
  batteries=0
  percent=0
  for bat in /sys/class/power_supply/BAT*; do
    batteries=$((batteries + 1))
    percent=$((percent + $(cat "$bat/energy_now") * 100 / $(cat "$bat/energy_full")))
  done
  echo $((percent / batteries))
}

while true; do
  printf "vol %d%%    bat %d%%     %s \n" \
    "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d . -f 2)" \
    "$(bat)" \
    "$(date +'%a %d %b %H:%M')"
  sleep 2
done
