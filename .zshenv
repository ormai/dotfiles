source /etc/locale.conf

export HOME="/home/$(whoami)"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_SCREENSHOTS_DIR="$HOME/Pictures/Screenshots"

export LC_ALL="en_US.UTF-8"

export XCURSOR_PATH="${XCURSOR_PATH}:~/.local/share/icons:/usr/share/icons"
export GSETTINGS_SCHEMA_DIR="/usr/share/glib-2.0/schemas"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_DATA_HOME/zsh/history"

append_path () {
  case "$PATH" in
    *:"$1":*)
      # if $1 is already in path, do nothing
      ;;
    *)
      PATH="${PATH:+$PATH:}$1"
      ;;
  esac
}

append_path $HOME/.local/bin
append_path $XDG_DATA_HOME/cargo/bin
append_path $XDG_DATA_HOME/gem/ruby/3.0.0/bin
append_path $XDG_DATA_HOME/npm/bin
append_path $XDG_DATA_HOME/go/bin
append_path $XDG_DATA_HOME/pipx/bin
append_path $XDG_DATA_HOME/nvim/mason/bin
export PATH

source $ZDOTDIR/lscolors.sh # Used by lf, zsh completion menu, exa

export SHELL=/usr/bin/zsh
export VISUAL=nvim
export EDITOR=nvim
export SYSTEMD_EDITOR=nvim
export TERMINAL=kitty
export BROWSER=firefox
export PAGER=less
export OPENER=xdg-open

export RANDOM
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_DEBUG_PLUGINS=0
export XCURSOR_SIZE=24
export XCURSOR_THEME=Adwaita

export MANPAGER="nvim +Man!"

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

# Wayland session
export QT_QPA_PLATFORM="xcb"
export SDL_VIDEODRIVER="wayland"

# Firefox
export MOZ_DBUS_REMOTE=1
export GDK_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1
