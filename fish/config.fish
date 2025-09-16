if status is-login
    source $HOME/.config/fish/environment.fish
end

if status is-interactive
    source $XDG_CONFIG_HOME/fish/abbreviations.fish
end
