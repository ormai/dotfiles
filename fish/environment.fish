# https://specifications.freedesktop.org/basedir-spec/latest/
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_CACHE_HOME $HOME/.cache # non-essential (cached) data files
fish_add_path $HOME/.local/bin

# Set paths from /etc/profile and /etc/profile.d/*.sh, and other paths.
fish_add_path /usr/bin /usr/local/bin /usr/local/sbin \
    /usr/lib/rustup/bin /usr/lib/jvm/default/bin \
    /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl \
    $CARGO_HOME/bin $XDG_DATA_HOME/npm/bin $XDG_DATA_HOME/nvim/mason/bin
# gnome-shell sets some locale types in the systemd environment
exportenv $XDG_CONFIG_HOME/user-dirs.dirs $XDG_CONFIG_HOME/locale.conf

set -gx LD_LIBRARY_PATH /lib:/usr/lib:/usr/local/lib

set -gx VISUAL hx
set -gx EDITOR $VISUAL
set -gx TERMINAL kgx
set -gx BROWSER zen-browser
set -gx OPENER xdg-open
set -gx PAGER less
set -gx LS_COLORS (vivid generate terminal)
set -gx QT_QPA_PLATFORMTHEME qt6ct # Required by qt6ct
set -gx RUSTC_WRAPPER sccache

# https://github.com/eth-p/bat-extras#batman
# FIXME: some pages are broken
batman --export-env | source

# Anki
set -gx QTWEBENGINE_LOCALES_PATH /usr/share/qt6/translations/qtwebengine_locales/
set -gx QTWEBENGINE_RESOURCES_PATH /usr/share/qt6/resources/
set -gx ANKI_WAYLAND 1

# Keep $HOME tidy (https://wiki.archlinux.org/title/XDG_Base_Directory)
set -gx ANDROID_USER_HOME $XDG_DATA_HOME/android
set -gx PASSWORD_STORE_DIR $XDG_DATA_HOME/pass
set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
set -gx GOPATH $XDG_DATA_HOME/go
set -gx PIPX_BIN_DIR $XDG_DATA_HOME/pipx/bin
set -gx HOME_ETC $XDG_CONFIG_HOME
set -gx DOCKER_CONFIG $XDG_CONFIG_HOME/docker
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
set -gx RANDFILE $XDG_DATA_HOME/open-ssl/rnd
set -gx WGETRC $XDG_CONFIG_HOME/wgetrc
set -gx GRADLE_USER_HOME $XDG_DATA_HOME/gradle
set -gx WINEPREFIX $XDG_DATA_HOME/wine
set -gx KONAN_DATA_DIR $XDG_DATA_HOME/konan
set -gx PSQL_HISTORY $XDG_STATE_HOME/psql_history
set -gx SQLITE_HISTORY $XDG_DATA_HOME/sqlite_history
set -gx PYTHON_HISTORY $XDG_STATE_HOME/python/history # since python 3.13
set -gx MARIADB_HISTFILE $XDG_DATA_HOME/mariadb_history
set -gx LESSHISTFILE $XDG_CACHE_HOME/lesshst
set -gx NODE_REPL_HISTORY $XDG_CACHE_HOME/node_repl_history
set -gx TEXMFHOME $XDG_DATA_HOME/texmf
set -gx TEXMFVAR $XDG_CACHE_HOME/texlive/texmf-var
set -gx TEXMFCONFIG $XDG_CONFIG_HOME/texlive/texmf-config
set -gx PYTHONPYCACHEPREFIX $XDG_CACHE_HOME/python
set -gx PYTHONUSERBASE $XDG_DATA_HOME/python
set -gx INPUTRC $XDG_CONFIG_HOME/readline/inputrc
set -gx HISTFILE $XDG_STATE_HOME/sh_history
set -gx DOTNET_CLI_HOME $XDG_DATA_HOME/dotnet
set -gx W3M_DIR $XDG_DATA_HOME/w3m
set -gx R_HISTFILE $XDG_CONFIG_HOME/R/history
set -gx JUPYTERLAB_DIR $XDG_DATA_HOME/jupyter/lab
set -gx KERAS_HOME $XDG_STATE_HOME/keras
