function clean
    sudo paccache -r
    paru -Sccd --noconfirm
    pip cache purge
end
