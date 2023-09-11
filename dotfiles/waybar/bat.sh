#!/usr/bin/sh

BAT1=$( < /sys/class/power_supply/BAT0/capacity )
BAT2=$( < /sys/class/power_supply/BAT1/capacity )
LEVEL=$(( ($BAT1 + $BAT2) / 2 ))

STATUS1=$( < /sys/class/power_supply/BAT0/status )
STATUS2=$( < /sys/class/power_supply/BAT1/status )
[[ $STATUS1 == "Charging" || $STATUS2 == "Charging" ]] && CHARGING="  󱐋"

if   [[ $LEVEL -lt 20 ]]; then
    ICON=" "
    CLASS="critical"
elif [[ $LEVEL -lt 40 ]]; then
    ICON=""
elif [[ $LEVEL -lt 60 ]]; then
    ICON=""
elif [[ $LEVEL -lt 80 ]]; then
    ICON=""
else
    ICON=""
fi

echo -e "$LEVEL% $ICON$CHARGING\n\n$CLASS"
