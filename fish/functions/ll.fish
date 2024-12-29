function ll -w eza -d 'List files with details'
  eza -Bla --sort=modified --git --time-style=long-iso $argv
end
