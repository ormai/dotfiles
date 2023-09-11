gsettings set org.gnome.desktop.interface cursor-theme $XCURSOR_THEME
gsettings set org.gnome.desktop.interface cursor-size $XCURSOR_SIZE

wl-paste --type text --watch cliphist store
wl-paste --type image --watch cliphist store
