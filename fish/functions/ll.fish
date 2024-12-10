function ll --wraps='eza -Bla --sort=modified --git --time-style=long-iso' --description 'alias ll eza -Bla --sort=modified --git --time-style=long-iso'
    eza -Bla --sort=modified --git --time-style=long-iso $argv
end
