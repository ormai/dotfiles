#!/usr/bin/zsh

alias sudo="doas "
alias doas="doas "

alias rz="source $ZDOTDIR/.zshrc"

alias diario="nvim -c 'set wrap' ~/vault/diario/2023.md "

# applications
alias open="xdg-open"
alias irssi="irssi --home=$XDG_CONFIG_HOME/irssi --config=$XDG_CONFIG_HOME/irssi/config"
alias trr="transmission-remote"
alias tw="watch -n 0.2 \"transmission-remote -l\""
alias sputifai="(pgrep mpd > /dev/null || mpd) && ncmpcpp"
alias mw="monero-wallet-cli --wallet-file ~/.bitmonero/xmrwlt"

alias camera="ffplay rtsp://admin:marioMARIO04@192.168.1.2:554/onvif2"

alias neofetch="neofetch --kitty  ~/Pictures/arch.png --size 280px --xoffset 2"

alias ssh="kitty +kitten ssh"

# safety
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

# exa
alias ls="exa --icons"                       # [L]i[S]t
alias le="exa -Blars modified --git --icons" # [L]ist [E]verything
alias lt="exa -T --icons"                    # [L]ist [T]ree

#git
alias gs="git status"
alias ga="git add ."
alias gc="git commit -a"
alias gp="git push origin main"
alias gr="git pull --rebase origin main"

# remove padding when running tui programs with wrapper script
alias nvim="tuipadding.sh nvim $@"
alias btop="tuipadding.sh btop $@"
alias ncdu="tuipadding.sh ncdu --color dark $@"
