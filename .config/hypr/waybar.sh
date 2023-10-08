#!/usr/bin/env bash

if [[ $(pgrep waybar) ]]
then
  pkill -SIGUSR2 waybar
else
  waybar
fi
