function clean --description 'Free storage'
    paru -Rsnu (paru -Qqd) # orphans
    sudo paccache -rk1
    sudo paccache -ruk0
    yes | paru -Sccd
    sudo docker system prune --all --force
    # cargo cache --autoclean
    pip cache purge
    uv cache clean
    gio trash --empty
    sudo journalctl --vacuum-time=2d
    npm cache clean --force
    npm cache verify
end
