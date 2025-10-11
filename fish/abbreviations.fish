# Files
abbr ll eza -laM --smart-group --sort=modified --git --time-style=iso
abbr ls eza
abbr trash gio trash
abbr mv mv -iv
abbr rm rm -iv
abbr cp cp -iv

# Programs
abbr top top -u (whoami)
abbr ip ip -c
abbr dlv2 dlv2 --silent
abbr duf duf --only local
abbr venv source .venv/bin/activate.fish
abbr copy wl-copy
abbr paste wl-paste
abbr hx helix
abbr onefetch onefetch --number-of-authors 5 --number-of-file-churns 0 --no-title

# Git
abbr a git add
abbr s git status --short
abbr d git diff
abbr c git commit -v
abbr l git log --graph --abbrev-commit --date=relative \
    --pretty=format:"'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset'"

# Enforce XDG program files location
abbr adb HOME=$XDG_DATA_HOME/android adb
abbr mvn mvn -gs $XDG_CONFIG_HOME/maven/settings.xml
abbr irrsi irssi --config=$XDG_CONFIG_HOME/irssi/config \
    --home=$XDG_DATA_HOME/irssi
