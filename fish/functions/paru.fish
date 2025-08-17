function paru -w paru
    # Update the package list after using paru
    command paru $argv
    and command paru -Qqm > $XDG_CONFIG_HOME/packages-aur.txt
    and command paru -Qqe | grep -vxf $XDG_CONFIG_HOME/packages-aur.txt > $XDG_CONFIG_HOME/packages.txt
end
