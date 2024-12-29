if status is-login
  source $HOME/.config/fish/env.fish
end

if status is-interactive
  abbr s git status --short
  abbr d git diff

  abbr --position anywhere ip ip -c
  abbr --position anywhere mv mv -iv
  abbr --position anywhere rm rm -i
  abbr --position anywhere cp cp -i

  abbr --position anywhere ncdu ncdu --color dark

  abbr adb HOME=$XDG_DATA_HOME/android adb
end
