#!/bin/sh

if ! wpctl status | grep capture
then
  exit 0
fi

text=""
if wpctl get-volume @DEFAULT_SOURCE@ | grep MUTED
then
  text=""
fi
echo $text
