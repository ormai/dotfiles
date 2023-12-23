export LC_ALL="en_US.UTF-8"

# Paths and locations
export HOME=/home/"$(whoami)"
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state
export XDG_SCREENSHOTS_DIR="$HOME"/Pictures/Screenshots

export XCURSOR_PATH="${XCURSOR_PATH}:~/.local/share/icons:/usr/share/icons"
export GSETTINGS_SCHEMA_DIR=/usr/share/glib-2.0/schemas

export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export HISTFILE="$XDG_DATA_HOME"/zsh/history

appendPath () { # From /etc/profile
  case "$PATH" in
    *:"$1":*) # if $1 is already in PATH, do nothing
      ;;
    *)
      PATH="${PATH:+$PATH:}$1"
      ;;
  esac
}

appendPath "$HOME"/.local/bin
appendPath "$XDG_DATA_HOME"/cargo/bin
appendPath "$XDG_DATA_HOME"/gem/ruby/3.0.0/bin
appendPath "$XDG_DATA_HOME"/npm/bin
appendPath "$XDG_DATA_HOME"/go/bin
appendPath "$XDG_DATA_HOME"/pipx/bin
appendPath "$XDG_DATA_HOME"/nvim/mason/bin
export PATH

# <https://wiki.archlinux.org/title/XDG_Base_Directory>
export LESSHISTFILE="$XDG_CACHE_HOME"/lesshst
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export PIPX_BIN_DIR="$XDG_DATA_HOME"/pipx/bin
export HOME_ETC="$XDG_CONFIG_HOME"
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export RANDFILE="$XDG_DATA_HOME"/open-ssl/rnd
export PYTHONHISTFILE="$XDG_DATA_HOME"/python/history
export NODE_REPL_HISTORY="$XDG_CACHE_HOME"/node_repl_history
export WGETRC="$XDG_CONFIG_HOME"/wgetrc
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default

# Applications
export SHELL=/usr/bin/zsh
export VISUAL=nvim
export EDITOR=nvim
export SYSTEMD_EDITOR=nvim
export TERMINAL=kitty
export BROWSER=firefox
export PAGER=less
export OPENER=xdg-open
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_DEBUG_PLUGINS=0
#export XCURSOR_SIZE=24
export MANPAGER="nvim +Man!"
export XCURSOR_THEME=Adwaita
source $ZDOTDIR/lscolors.sh # Used by lf, zsh completion menu, exa
export RANDOM

# Wayland
export QT_QPA_PLATFORM="xcb"
export SDL_VIDEODRIVER="wayland"

# Firefox
export MOZ_DBUS_REMOTE=1
export GDK_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1
