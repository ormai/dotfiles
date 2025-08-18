if status is-login
    source ~/.config/fish/env.fish
end

if status is-interactive
    set_color brblack
    and fortune
    source ~/.config/fish/abbreviations.fish
end
