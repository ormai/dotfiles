abbr ls 'eza --hyperlink'
abbr ll 'eza -laM -s modified --git --time-style=iso --icons --hyperlink'
abbr lt 'eza -T --icons --hyperlink'
abbr mv 'mv -iv'
abbr rm 'rm -iv'
abbr cp 'cp -iv'
abbr ip 'ip -c'
abbr df 'duf --only local,network'
abbr du dust # Du, du hast, du hast mich...
abbr hx helix
abbr cat bat
abbr top 'top -u $USER'
abbr copy wl-copy
abbr paste wl-paste
abbr trash 'gio trash'
abbr rsync 'rsync -avhL --partial --info=progress2'
abbr venv 'source .venv/bin/activate.fish'
abbr onefetch 'onefetch --number-of-authors 5 --number-of-file-churns 0 --no-title'
abbr monero 'monero-wallet-cli --log-file $XDG_STATE_HOME/monero/monero-wallet-cli.log --wallet-file $XDG_DOCUMENTS_DIR/MoneroWallet --daemon-address 192.168.1.8:18089 --trusted-daemon'
abbr irssi 'irssi --config=$XDG_CONFIG_HOME/irssi/config.conf --home=$XDG_DATA_HOME/irssi'

# Git
abbr a git add
abbr s git status --short
abbr d git diff
abbr c git commit -v
abbr l git log --graph --abbrev-commit --date=relative --pretty=format:"'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset'"
