alias doas="doas " # needed for doas to work with aliases
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias ls=exa
alias le="exa -Blars modified --git" # List Everything
alias s="git status --short"
alias l="git log --oneline"
alias nvim="nvim --listen /tmp/\$RANDOM-nvim.pipe"

shopt -s autocd

bind '"\C-o":"lfcd\C-m"'

# <https://codeberg.org/dnkl/foot/wiki#dynamic-color-changes>
# The signal is issued by ~/.local/bin/color after it updates
# org.gnome.desktop.interface color-scheme via gsettings, then
# ~/.config/foot/theme.sh syncronizes foot's color scheme with that value.
#trap "$XDG_CONFIG_HOME"/foot/theme.sh SIGUSR1


# foot: jump between prompts
prompt_marker() { printf "\e]133;A\e\\"; }
PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }prompt_marker

# report current working directory to foot
# https://codeberg.org/dnkl/foot/wiki#spawning-new-terminal-instances-in-the-current-working-directory
osc7_cwd() {
    local encoded="" pos c o
    for (( pos=0; pos<${#PWD}; pos++ )); do
        c=${PWD:$pos:1}
        case "$c" in
            [-/:_.!\'\(\)~[:alnum:]] ) o="${c}" ;;
            * ) printf -v o '%%%02X' "'${c}" ;;
        esac
        encoded+="${o}"
    done
    printf "\e]7;file://%s%s\e\\" "${HOSTNAME}" "${encoded}"
}
PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }osc7_cwd

lfcd() { cd "$(/usr/bin/lf -print-last-dir "$@")" || return; }

PS1="\[\033[37m\]\w \[\033[36m\]\$\[\033[m\] "
