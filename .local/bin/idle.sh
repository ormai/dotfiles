#!/usr/bin/env bash

/usr/bin/swayidle -w \
  timeout 180 lock.sh \
  timeout 200 "swaymsg 'output \'*\' power off'" \
  resume "swaymsg 'output \'*\' power on'" \
  before-sleep lock.sh
