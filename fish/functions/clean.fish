function clean -d 'Free storage'
    sudo pacman -Rsu (pacman -Qqd) # orphans
    sudo paccache -rk1
    sudo paccahe -ruk0
    paru -Sccd
    sudo docker system prune --all --force
    cargo cache --autoclean
    pip cache purge
    uv cache clean
    gio trash --empty
end
