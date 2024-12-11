if status is-login
  source $HOME/.config/fish/env.fish
end

if status is-interactive
  abbr s git status --short
  abbr d git diff
  abbr l git log --oneline --decorate --graph
end
