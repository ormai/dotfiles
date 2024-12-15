# https://specifications.freedesktop.org/basedir-spec/latest/
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

# Trying to keep ~ clean
# https://wiki.archlinux.org/title/XDG_Base_Directory
set -gx ANDROID_USER_HOME $XDG_DATA_HOME/android
set -gx ANDROID_SDK_HOME $ANDROID_USER_HOME
set -gx ANDROID_HOME $ANDROID_USER_HOME
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
set -gx _JAVA_OPTIONS -Djava.util.prefs.userRoot=$XDG_DATA_HOME/java
set -gx HISTFILE $XDG_DATA_HOME/sh_history

# Do what /etc/profile and /etc/profile.d/*.sh do
fish_add_path -p /usr/local/sbin /usr/local/bin /usr/bin
fish_add_path -p /usr/lib/jvm/default/bin
fish_add_path -p /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl
fish_add_path -p /usr/lib/rustup/bin

set -e TERMCAP MANPATH

# Other custom paths
fish_add_path -p $HOME/.local/bin $GOPATH/bin $CARGO_HOME/bin $PIPX_BIN_DIR
fish_add_path -p $XDG_DATA_HOME/npm/bin $XDG_DATA_HOME/nvim/mason/bin
fish_add_path -p $XDG_DATA_HOME/JetBrains/Toolbox/apps/intellij-idea-ultimate/bin

# Locale
set -gx LANG en_US.UTF-8
set -gx LC_ADDRESS en_DK.UTF-8
set -gx LC_COLLATE it_IT.UTF-8
set -gx LC_CTYPE it_IT.UTF-8
set -gx LC_IDENTIFICATION it_IT.UTF-8
set -gx LC_MEASUREMENT en_DK.UTF-8
set -gx LC_MESSAGES en_US.UTF-8
set -gx LC_MONETARY en_DK.UTF-8
set -gx LC_NAME it_IT.UTF-8
set -gx LC_NUMERIC en_DK.UTF-8
set -gx LC_PAPER it_IT.UTF-8
set -gx LC_TELEPHONE it_IT.UTF-8
set -gx LC_TIME en_DK.UTF-8

# Applications
set -gx EDITOR nvim
set -gx VISUAL $EDITOR
set -gx TERMINAL blackbox
set -gx BROWSER firefox
set -gx OPENER xdg-open
set -gx PAGER less
set -gx LS_COLORS (vivid generate gruvbox-dark-soft)

set -gx QT_QPA_PLATFORM wayland
set -gx QT_QPA_PLATFORMTHEME qt5ct:qt6ct
set -gx SDL_VIDEODRIVER wayland
set -gx GDK_BACKEND wayland
set -gx VDPAU_DRIVER va_gl

set -gx RUSTC_WRAPPER sccache

set -gx _JAVA_AWT_WM_NONREPARENTING 1 # otherwise swing doesn't work
