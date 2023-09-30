#!/usr/bin/env bash

if [[ ! $(wpctl status | rg "capture") ]]; then
  echo ""
  exit 0
fi

text=""

if [[ $(wpctl get-volume @DEFAULT_SOURCE@ | rg MUTED) ]]; then
  text=""
fi

echo -e "$text\n$(wpctl get-volume @DEFAULT_SOURCE@)"
