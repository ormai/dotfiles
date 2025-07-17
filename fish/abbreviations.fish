abbr a git add
abbr s git status --short
abbr d git diff
abbr c git commit -v
abbr l git log --graph --pretty=format:"'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset'" --abbrev-commit --date=relative

abbr ll eza -Bla --sort=modified --git --time-style=long-iso
abbr ls eza

abbr trash gio trash
abbr --position anywhere mv mv -iv
abbr --position anywhere rm rm -iv
abbr --position anywhere cp cp -iv

abbr ip ip -c

abbr dlv dlv --silent

abbr duf duf --only local

abbr adb HOME=$XDG_DATA_HOME/android adb

abbr venv source .venv/bin/activate.fish
abbr copy wl-copy
abbr paste wl-paste

abbr mvn mvn -gs $XDG_CONFIG_HOME/maven/settings.xml

abbr ps ps -eo pid,nlwp,c,pcpu,rss,pmem,cputime,cmd
