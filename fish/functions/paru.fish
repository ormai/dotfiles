function paru -w paru
  # Update the package list after using paru
  command paru $argv
    and command paru -Qqe | grep -vxf (command paru -Qqm | psub) >$XDG_CONFIG_HOME/packages.txt
    and command paru -Qqm >$XDG_CONFIG_HOME/packages-aur.txt
end
