if status is-login
  fish_add_path -p "$HOME/.local/bin" "$CARGO_HOME/bin" \
    "$XDG_DATA_HOME/npm/bin" "$GOPATH/bin" "$PIPX_BIN_DIR" \
    "$XDG_DATA_HOME/JetBrains/Toolbox/apps/intellij-idea-ultimate/bin"

  source "$HOME/.config/fish/profile"

  exec bash -c 'source /etc/profile; exec fish'
end
