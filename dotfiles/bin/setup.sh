#!/usr/bin/sh
#
# This is a script to set up my system. For now it's just a work in progress.

# install programs
pacman -Syu firefox

# Set up NewTab in Firefox
ln -s $HOME/.mozilla/mario/external/autoconfig.cfg /usr/lib/firefox/autoconfig.cfg
ln -s $HOME/.mozilla/mario/external/autoconfig.js /usr/lib/firefox/defaults/pref/autoconfig.js
