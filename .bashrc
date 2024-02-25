alias doas="doas " # needed for doas to work with aliases
alias nvim="nvim --listen /tmp/\$RANDOM-nvim.pipe"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias ls=exa
alias le="exa -Blars modified --git" # List Everything
alias s="git status --short"

shopt -s autocd

lfcd() {
  cd "$(/usr/bin/lf -print-last-dir "$@")" || return
}
bind '"\C-o":"lfcd\C-m"'

PS1="\[\033[37m\]\w \[\033[36m\]\$\[\033[m\] "
