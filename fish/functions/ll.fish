function ll --wraps='eza -Bla --sort=modified --git --time-style=long-iso' --description 'List files with details'
  eza -Bla --sort=modified --git --time-style=long-iso $argv
end
