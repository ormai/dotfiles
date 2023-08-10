#!/usr/bin/zsh

# User modified files outside $HOME are symbolic links
[[ ! -e /etc/zsh/zshenv ]] && doas ln -s ~/.config/zsh/zshenv /etc/zsh

# System locations
export HOME="/home/mario"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_SCREENSHOTS_DIR="$HOME/Pictures/Screenshots"
export PATH="$PATH:$HOME/.local/bin:$HOME/.local/scripts:/usr/local/go/bin:$HOME/.local/share/cargo/bin"
export XCURSOR_PATH="${XCURSOR_PATH}:~/.local/share/icons"
export GSETTINGS_SCHEMA_DIR="/usr/share/glib-2.0/schemas"

# Apps
export SHELL="/usr/bin/zsh"
export VISUAL="nvim"
export EDITOR="nvim"
export SYSTEMD_EDITOR="nvim"
export TERMINAL="kitty"
export TERM="xterm-256color"
export BROWSER="firefox"
export PAGER="less"
export OPENER="xdg-open"
export WP_SOURCE_ID=$(wpctl status | rg --after-context=1 --max-count=1 Sources: | tail -1 | cut -d . -f 1 | sed -e "s/ //g" | cut -d '*' -f 2)

# Customization
export RANDOM
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_DEBUG_PLUGINS=0
export XCURSOR_SIZE=24
export XCURSOR_THEME=Pix
gsettings set org.gnome.desktop.interface cursor-theme $XCURSOR_THEME
gsettings set org.gnome.desktop.interface cursor-size $XCURSOR_SIZE
# Colored man pages
export MANPAGER="nvim +Man!"

# Keep $HOME as clean as possible
export LESSHISTFILE="$XDG_CACHE_HOME/lesshst"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export HOME_ETC="$XDG_CONFIG_HOME"
export NODE_REPL_HISTORY="$XDG_CACHE_HOME/node_repl_history"
export NODE_PATH="$XDG_DATA_HOME/node_modules"

# Firefox
export MOZ_DBUS_REMOTE=1
export GDK_BACKEND="wayland"
export MOZ_ENABLE_WAYLAND=1

# Wayland session
export QT_QPA_PLATFORM="wayland;xcb"
export SDL_VIDEODRIVER="wayland"
export XDG_CURRENT_DESKTOP="Hyprland"
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
