function clean -d 'Free storage'
  sudo pacman -Rsu (pacman -Qqd) # orphans
  sudo paccache -r
  paru -Sccd
  pip cache purge
  gio trash --empty
end
