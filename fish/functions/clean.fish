function clean -d 'Free storage'
    paru -Rsnu (paru -Qqd) # orphans
    sudo paccache -rk1
    sudo paccache -ruk0
    paru --noconfirm -Sccd
    sudo docker system prune --all --force
    cargo cache --autoclean
    pip cache purge
    uv cache clean
    gio trash --empty
end
