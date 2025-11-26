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
    $CARGO_HOME/bin $XDG_DATA_HOME/npm/bin $XDG_DATA_HOME/nvim/mason/bin \
    $XDG_DATA_HOME/JetBrains/Toolbox/apps/intellij-idea-ultimate/bin \
    $XDG_DATA_HOME/JetBrains/Toolbox/apps/android-studio/bin

exportenv $XDG_CONFIG_HOME/user-dirs.dirs $XDG_CONFIG_HOME/locale.conf

set -gx LD_LIBRARY_PATH /lib:/usr/lib:/usr/local/lib

set -gx EDITOR helix
set -gx VISUAL $EDITOR
set -gx TERMINAL ghostty
set -gx BROWSER zen-browser
set -gx OPENER xdg-open
set -gx PAGER less
set -gx LS_COLORS (vivid generate gruvbox-dark-soft)

# For Xwayland
set -gx XCURSOR_SIZE 48

batman --export-env | source

set -gx QT_QPA_PLATFORM wayland
set -gx QT_QPA_PLATFORMTHEME qt6ct
set -gx SDL_VIDEODRIVER wayland
set -gx GDK_BACKEND wayland
set -gx RUSTC_WRAPPER sccache

# Keep $HOME tidy (https://wiki.archlinux.org/title/XDG_Base_Directory)
set -gx ANDROID_USER_HOME $XDG_DATA_HOME/android
set -gx PASSWORD_STORE_DIR $XDG_DATA_HOME/pass
set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
set -gx GOPATH $XDG_DATA_HOME/go
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx PIPX_BIN_DIR $XDG_DATA_HOME/pipx/bin
set -gx HOME_ETC $XDG_CONFIG_HOME
set -gx DOCKER_CONFIG $XDG_CONFIG_HOME/docker
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
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
set -gx _JAVA_OPTIONS "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
set -gx R_HISTFILE $XDG_CONFIG_HOME/R/history
set -gx JUPYTERLAB_DIR $XDG_DATA_HOME/jupyter/lab
set -gx KERAS_HOME $XDG_STATE_HOME/keras
