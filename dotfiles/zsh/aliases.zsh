#!/usr/bin/zsh

alias sudo="doas "
alias doas="doas "

alias rz="source $ZDOTDIR/.zshrc"

# applications
alias open="xdg-open"
alias nv="nvim"
alias py="python"
alias irssi="irssi --home=$XDG_CONFIG_HOME/irssi --config=$XDG_CONFIG_HOME/irssi/config"
alias tr="transmission-remote"
alias tw="watch -n 0.2 \"transmission-remote -l\""
alias ncdu="ncdu --color dark"
alias sputifai="(pgrep mpd > /dev/null || mpd) && ncmpcpp"
alias night="gammastep -qq -l 39.4:16.3 -b 1:0.8 -m wayland -t 6500:3500 &"
alias mw="monero-wallet-cli --wallet-file ~/.bitmonero/xmrwlt"

alias camera="ffplay rtsp://admin:marioMARIO04@192.168.1.3:554/onvif2"

alias hide="mv ~/vault/collections/ml.md ~/vault/collections/.ml.md"
alias show="mv ~/vault/collections/.ml.md ~/vault/collections/ml.md"

alias neofetch="neofetch --kitty  ~/Pictures/arch.png --size 280px --xoffset 2"

alias ssh="kitty +kitten ssh"

# safety
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

# exa
alias ls="exa --icons"                       # LiSt
alias le="exa -Blars modified --git --icons" # List Everything
alias lt="exa -T --icons"                    # List Tree

#git
alias gs="git status"
alias ga="git add ."
alias gc="git commit -a"
alias gp="git push origin main"
alias gr="git pull --rebase origin main"
