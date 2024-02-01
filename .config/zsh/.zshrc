source $ZDOTDIR/aliases.zsh

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

HISTSIZE=10000
SAVEHIST=10000

setopt auto_cd # auto change directory

PROMPT="%F{8}%~%f %B%F{green}$%f%b "

lfcd () {
  tmp="$(mktemp)"
  /usr/bin/lf -last-dir-path="$tmp" "$@"
  dir="$(< "$tmp")" && rm -f "$tmp"
  [[ -d "$dir" && "$dir" != "$(pwd)" ]] && cd "$dir"
}
bindkey -s '^o' 'lfcd\n'

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # for Debian

KEYTIMEOUT=1
MODE_CURSOR_VIINS="bar"
MODE_CURSOR_REPLACE="block"
MODE_CURSOR_VICMD="block"
MODE_CURSOR_SEARCH="underline"
MODE_CURSOR_VISUAL="block"
MODE_CURSOR_VLINE="block"
MODE_INDICATOR=""
source $ZDOTDIR/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh

source /usr/share/fzf/completion.zsh

# https://github.com/junegunn/fzf#key-bindings-for-command-line
FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
source /usr/share/fzf/key-bindings.zsh

bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes
source $ZDOTDIR/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
