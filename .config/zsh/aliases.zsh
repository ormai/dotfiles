alias sudo="sudo "
alias doas="doas "

alias rz="source $ZDOTDIR/.zshrc"

# applications
alias open="xdg-open"
alias trr="transmission-remote"
alias tw="watch -n 0.2 \"transmission-remote -l\""
alias sputifai="(pgrep mpd > /dev/null || mpd) && ncmpcpp"
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"' 
alias camera="ffplay rtsp://admin:marioMARIO04@192.168.1.2:554/onvif2"

alias ssh="kitty +kitten ssh"

alias nvim="nvim --listen ~/.cache/nvim/nvim_$RANDOM.pipe"

# iamb performance workaround
alias iamb="systemd-run --uid=$USER --slice=iamb.slice -t iamb"

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

run() {
  executable="${1%%.cpp}"
  /usr/bin/g++ -std=c++11 -Wall $1 -o $executable
  ./$executable
  # rm -f $executable
}

# Remove Kitty's paddings when running a tui
# alias nvim="toggle-kitty-padding.sh nvim $@"
# alias btop="toggle-kitty-padding.sh btop $@"
# alias ncdu="toggle-kitty-padding.sh ncdu --color dark $@"
# alias man="toggle-kitty-padding.sh man $@"

# on remote machines
#alias nvim="kitten edit-in-kitty"

