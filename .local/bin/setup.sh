#!/usr/bin/env bash

dotConfig=(
  dunst glava hypr imv kitty lf ncmpcpp neofetch newsboat nvim rofi
  sway waybar zathura zsh chromium-flags.conf electron-flags.conf mimeapps.list
  wgetrc
)
for i in ${dotConfig[@]}; do
  ln -s $dotfilesDir/.config/$i $XDG_CONFIG_HOME/
done

dotLocal=("share/fonts" "share/icons" "share/themes")
for i in ${dotLocal[@]}; do
  ln -s $dotfilesDir/.local/$i $XDG_DATA_HOME/$i
done

ln -s $dotfilesDir/.local/bin $HOME/.local/
ln -s $dotfilesDir/.zshenv $HOME
ln -s $dotfilesDir/.mozilla/mario/chrome $HOME/.mozilla/mario/chrome
