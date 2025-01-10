function paru -w paru
  # Update the package list after using paru
  command paru $argv
    and pacman -Qq >$XDG_CONFIG_HOME/packages.txt
    and pacman -Qqe >$XDG_CONFIG_HOME/packages-aur.txt
end
