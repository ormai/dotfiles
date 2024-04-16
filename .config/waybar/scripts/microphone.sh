#!/bin/sh

if ! wpctl status | grep capture
then
  exit 0
fi

icon=""
if wpctl get-volume @DEFAULT_SOURCE@ | grep MUTED
then
  icon=""
fi
echo $icon
