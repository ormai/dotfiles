#!/bin/sh

SYS=/sys/class/power_supply

if [ "$(cat $SYS/BAT0/status)" = "Charging" ] ||
   [ "$(cat $SYS/BAT1/status)" = "Charging" ]
then
  CHARGING="󱐋"
fi

LEVEL=$((($(cat $SYS/BAT0/capacity) + $(cat $SYS/BAT1/capacity)) / 2))

if [ $LEVEL -lt 20 ]
then
  ICON=" "
  CLASS="critical"
elif [ $LEVEL -lt 40 ]
then
  ICON=""
elif [ $LEVEL -lt 60 ]
then
  ICON="" 
elif [ $LEVEL -lt 80 ]
then
  ICON=""
else
  ICON=""
fi

echo "$CHARGING $LEVEL% $ICON"
echo "$CLASS"
