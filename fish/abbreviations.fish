abbr ll eza -laM --smart-group --sort=modified --git --time-style=iso
abbr ls eza
abbr trash gio trash
abbr mv mv -iv
abbr rm rm -iv
abbr cp cp -iv

abbr ip ip -c
abbr dlv dlv --silent
abbr duf duf --only local
abbr venv source .venv/bin/activate.fish
abbr copy wl-copy
abbr paste wl-paste

abbr a git add
abbr s git status --short
abbr d git diff
abbr c git commit -v
abbr l git log --graph --abbrev-commit --date=relative \
    --pretty=format:"'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset'"

abbr adb HOME=$XDG_DATA_HOME/android adb
abbr mvn mvn -gs $XDG_CONFIG_HOME/maven/settings.xml
abbr irrsi irssi --config=$XDG_CONFIG_HOME/irssi/config \
    --home=$XDG_DATA_HOME/irssi
