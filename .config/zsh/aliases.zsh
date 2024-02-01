alias sudo="sudo "
alias doas="doas "

alias rz="source $ZDOTDIR/.zshrc"

# applications
alias trr="transmission-remote"
alias tw="watch -n 0.2 \"transmission-remote -l\""
alias sputifai="(pgrep mpd > /dev/null || mpd) && ncmpcpp"
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"' 
alias newsboat="newsboat --quiet"
alias ncdu="ncdu --color=dark"

alias ssh="kitty +kitten ssh"

#alias nvim="nvim --listen ~/.cache/nvim/nvim_$RANDOM.pipe"

# safety
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"


# exa
alias ls="exa --icons"                       # list
alias le="exa -Blars modified --git --icons" # list everything
alias lt="exa -T --icons"                    # list tree

#git
alias gs="git status --short"
alias gc="git commit -a"
alias ga="git add ."
alias gp="git push origin main"
alias gr="git pull --rebase origin main"

alias freq="history 0 | sed 's/[\t ]*[0-9]\+[\t ]*\([^ ]*\).*/\1/' | sort | uniq -c | sort -n | tail | sort -rn"

alias rescan="nmcli device wifi rescan"

# daily journal note
alias today="nvim +ZenMode ~/vault/diario/$(date -I).md"

# Remove Kitty's paddings when running a tui
# alias nvim="toggle-kitty-padding.sh nvim $@"
# alias btop="toggle-kitty-padding.sh btop $@"
# alias ncdu="toggle-kitty-padding.sh ncdu --color dark $@"
# alias man="toggle-kitty-padding.sh man $@"

# on remote machines
#alias nvim="kitten edit-in-kitty"

