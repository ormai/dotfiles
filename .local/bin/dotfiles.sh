#!/usr/bin/env bash

# Manually clone the repository in $GITDIR then run this script

GITDIR="$HOME/desk/dotfiles" # Where I manage my dotfiles

if [[ ! -d $GITDIR ]]
then
  echo "ERROR: $GITDIR does not exist."
  exit -1
fi

links() {
  # Make symbolic links
  mkdir -p $HOME/.config
  for i in $(/usr/bin/ls -1 $GITDIR/.config)
  do
    ln -f -s $GITDIR/.config/$i $HOME/.config
  done

  mkdir -p $HOME/.local
  ln -f -s $GITDIR/.local/bin $HOME/.local/
  ln -f -s $GITDIR/.zshenv $HOME/
  mkdir -p $HOME/.mozilla/mario/chrome
  ln -f -s $GITDIR/.mozilla/mario/chrome $HOME/.mozilla/mario/chrome
}

installPackages() {
  # Install packages in the two lists with pacman
  sudo pacman --noconfirm -Syu $(< list.pacman)

  # Will ask for password. There will probably be conflicts between packages
  # and some AUR packages may not be found anymore. So manual intervention is
  # inevitable.

  # Install paru
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si

  paru --noconfirm -Syu  $(< list.aur)

  figlet DONE # is one of the packages
}

backupPackages() {
  pacman -Qm | grep -vx "$( pacman -Qmq )" > $GITDIR/list.pacman
  pacman -Qmq > $GITDIR/list.aur
  echo "Done!"
}

case $1 in
  backup)
    backupPackages
    ;;
  install)
    links
    installPackages
    ;;
  *)
    echo "Commands: backup, install"
    ;;
esac

exit 0
