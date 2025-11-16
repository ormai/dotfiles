abbr ls 'eza --hyperlink'
abbr ll 'eza --long --all --smart-group --mounts --sort=modified --git --time-style=iso --hyperlink --icons=auto'
abbr mv 'mv -iv'
abbr rm 'rm -iv'
abbr cp 'cp -iv'
abbr trash 'gio trash'
abbr ip 'ip -c'
abbr df 'duf --only local,network'
abbr du dust
abbr cat bat
abbr copy wl-copy
abbr paste wl-paste
abbr hx helix
abbr onefetch 'onefetch --number-of-authors 5 --number-of-file-churns 0 --no-title'
abbr monero 'monero-wallet-cli --log-file $XDG_STATE_HOME/monero/monero-wallet-cli.log --wallet-file $XDG_DOCUMENTS_DIR/MoneroWallet --daemon-address 192.168.1.8 --trusted-daemon'
abbr top 'top -u (whoami)'
abbr dlv2 'dlv2 --silent'
abbr venv 'source .venv/bin/activate.fish'

# Git
abbr a git add
abbr s git status --short
abbr d git diff
abbr c git commit -v
abbr l git log --graph --abbrev-commit --date=relative --pretty=format:"'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset'"

# Enforce XDG program files location
abbr adb 'HOME=$XDG_DATA_HOME/android adb'
abbr mvn 'mvn -gs $XDG_CONFIG_HOME/maven/settings.xml'
abbr irrsi 'irssi --config=$XDG_CONFIG_HOME/irssi/config --home=$XDG_DATA_HOME/irssi'
