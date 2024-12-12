function clean
  sudo pacman -Rsu --noconfirm (pacman -Qqd) # orphans
  sudo paccache -r
  paru -Sccd --noconfirm
  pip cache purge
  rm -rf $XDG_DATA_HOME/Trash/files/*
end
