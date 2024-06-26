#!/bin/sh

# Manually clone the repository in $GITDIR then run this script

GITDIR="$HOME/Desktop/dotfiles" # Where I manage my dotfiles

if [ ! -d "$GITDIR" ]
then
  echo "ERROR: $GITDIR does not exist."
  return 1
fi

makeLinks() {
  mkdir -p "$HOME"/.config

  for i in "$GITDIR"/.config/*
  do
    ln -f -s "$i" "$HOME"/.config
  done

  mkdir -p "$HOME"/.local
  ln -f -s "$GITDIR"/.local/bin "$HOME"/.local/
  for dot in .bashrc .profile .inputrc
  do
    ln -f -s "$GITDIR"/$dot "$HOME"/
  done
  mkdir -p "$HOME"/.mozilla/mario/chrome
  ln -f -s "$GITDIR"/.mozilla/mario/chrome "$HOME"/.mozilla/mario/chrome

  # Electron
  ln -f -s "$XDG_CONFIG_HOME"/chromium-flags.conf "$XDG_CONFIG_HOME"/electron-flags.conf
  ln -f -s "$XDG_CONFIG_HOME"/chromium-flags.conf "$XDG_CONFIG_HOME"/electron28-flags.conf
}

installPackages() {
  # Install packages in the two lists with pacman
  sudo pacman --noconfirm -Syu "$(cat list.pacman)"

  # Will ask for password. There will probably be conflicts between packages
  # and some AUR packages may not be found anymore. So manual intervention is
  # inevitable.

  # Install paru
  if ! command -v paru
  then
    git clone https://aur.archlinux.org/paru.git
    cd paru || return
    makepkg -si
  fi

  paru --noconfirm -Syu "$(cat list.aur)"

  figlet DONE # is one of the packages
}

backupPackageList() {
  pacman -Qeq | grep -vx "$( pacman -Qmq )" > "$GITDIR"/list.pacman
  pacman -Qmq > "$GITDIR"/list.aur
  echo "Done!"
}

case $1 in
  backup) backupPackageList ;;
  install)
    makeLinks
    installPackages
    ;;
  *) echo "Usage: $(basename "$0") [backup, install]" ;;
esac

exit 0
