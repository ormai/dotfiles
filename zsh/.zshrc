source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/highlighting.zsh

source $ZDOTDIR/environment.zsh
source $ZDOTDIR/aliases.zsh

source $ZDOTDIR/fzf.zsh
# source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Keybindings
bindkey -s '^o' 'lfcd\n'

# History
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$ZDOTDIR/history"

[[ -n "${key[k]}"   ]] && bindkey -- "${key[k]}" up-line-or-beginning-search
[[ -n "${key[j]}" ]] && bindkey -- "${key[j]}" down-line-or-beginning-search

# Auto change directory
setopt auto_cd

# Autocompletion
# autoload -Uz compinit
# zstyle ':completion:*' menu select
# compinit
# setopt COMPLETE_ALIASES
# zstyle ':completion::complete:*' gain-privileges 1
# _comp_options+=(globdots)

# Prompt
PROMPT='%F{green}%~%f %F{red}%f ' 
#autoload -Uz vcs_info
#precmd_vcs_info() { vcs_info }
#precmd_functions+=( precmd_vcs_info )
#setopt prompt_subst
#RPROMPT=\$vcs_info_msg_0_
#zstyle ':vcs_info:git:*' formats '%F{black}[%b]%f'
#zstyle ':vcs_info:*' enable git

# Vi mode
# bindkey -v
# export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] ||
      [[ ${KEYMAP} = '' ]] ||
      [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Remember the last changed directory
lfcd () {
    tmp="$(mktemp)"
    /usr/bin/lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
