#!/bin/sh

SYS=/sys/class/power_supply

if [ "$(cat $SYS/BAT0/status)" = "Charging" ] ||
   [ "$(cat $SYS/BAT1/status)" = "Charging" ]
then
  charging=󱐋
fi

level=$((($(cat $SYS/BAT0/capacity) + $(cat $SYS/BAT1/capacity)) / 2))

if [ $level -lt 20 ]
then
  icon=
  class=critical
  if [ $level -lt 3 ]
  then
    notify-send -u critical 'Low battery'
  fi
elif [ $level -lt 40 ]
then
  icon=
elif [ $level -lt 60 ]
then
  icon=
elif [ $level -lt 80 ]
then
  icon=
else
  icon=
fi

echo "$charging $level% $icon"
echo "$class"
