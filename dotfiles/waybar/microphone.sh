#!/bin/bash

if [[ ! $(wpctl status | rg "capture") ]]; then
  echo ""
  exit 0
fi

text=""
[[ $(wpctl get-volume @DEFAULT_SOURCE@ | rg MUTED) ]] && text=""

echo -e "$text\n$(wpctl get-volume @DEFAULT_SOURCE@)"
