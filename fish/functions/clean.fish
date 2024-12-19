function clean
  sudo pacman -Rsu --noconfirm (pacman -Qqd) # orphans
  sudo paccache -r
  paru -Sccd --noconfirm
  pip cache purge
  gio trash --empty
end
