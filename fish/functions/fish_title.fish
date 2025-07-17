function fish_title
    # emacs is basically the only term that can't handle it.
    set -l cmd (status current-command)
    switch $cmd
        case fish
            set cmd "🐟 "
        # case nvim # nvim sets its own title
        #     set cmd "📝 "
        case git lazygit
            set cmd "🌿 "
        case curl wget ping
            set cmd "🌐 "
        case ssh
            set cmd "🖥️ "
        case cargo
            set cmd "🦀 "
        case docker docker-compose lazydocker
            set cmd "🐳 "
        case make
            set cmd "🛠️ "
        case node
            set cmd "🌲 "
        case pacman paru
            set cmd "📦 "
    end
    echo "$cmd   $(prompt_pwd)"
end
