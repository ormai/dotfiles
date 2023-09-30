#!/usr/bin/env bash

# This is a script to set up my system. For now it's just a work in progress.

# install programs
# pacman -Syu firefox

# Set up NewTab in Firefox
# ln -s $HOME/.mozilla/mario/external/autoconfig.cfg /usr/lib/firefox/autoconfig.cfg
# ln -s $HOME/.mozilla/mario/external/autoconfig.js /usr/lib/firefox/defaults/pref/autoconfig.js

dotfiles_dir=$HOME/vault/dotfiles

dot_config=(dunst glava hypr imv kitty lf ncmpcpp neofetch newsboat nvim rofi sway waybar zathura zsh chromium-flags.conf electron-flags.conf mimeapps.list wgetrc)
dot_local=("share/fonts" "share/icons" "share/themes")

for i in ${dot_config[@]}; do
  ln -s $dotfiles_dir/.config/$i $XDG_CONFIG_HOME/
done

for i in ${dot_local[@]}; do
  ln -s $dotfiles_dir/.local/$i $XDG_DATA_HOME/$i
done

ln -s $dotfiles_dir/.local/bin $HOME/.local/bin
ln -s $dotfiles_dir/.zshenv $HOME
