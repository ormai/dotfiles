if status is-login
    source $HOME/.config/fish/environment.fish
end

if status is-interactive
    set_color brblack
    and fortune
    source $XDG_CONFIG_HOME/fish/abbreviations.fish
end
