# man zshcompsys

zmodload zsh/complist #before compinit

# move in the completion menu using hjkl
bindkey -M menuselect "h" vi-backward-char
bindkey -M menuselect "k" vi-up-line-or-history
bindkey -M menuselect "j" vi-down-line-or-history
bindkey -M menuselect "l" vi-forward-char

autoload -Uz compinit; compinit
_comp_options+=(globdots) # for hidden files

zstyle ":completion:*" completer _extensions _complete _approximate _expand_alias

zstyle ":completion:*" use-cache on
zstyle ":completion:*" cache-path "$ZDOTDIR/zcompcache"
compinit -d $ZDOTDIR/zcompdump-$ZSH_VERSION

zstyle ":completion::complete:*" gain-privileges 1 # for sudo and doas

zstyle ":completion:*" menu select # use completion menu
zstyle ":completion:*:warnings" format " %F{red}# no match found%f"
zstyle ":completion:*" group-name "" # place group name above every group
zstyle ":completion:*:*:*:*:descriptions" format "%F{11}# %d%f" # gropu name
zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' file-sort access
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
