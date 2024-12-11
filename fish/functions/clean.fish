function clean
    sudo paccache -r
    paru -Sccd --noconfirm
    pip cache purge
    rm -rf $XDG_DATA_HOME/Trash/*
end
