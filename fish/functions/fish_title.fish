function fish_title
    set -l cmd (status current-command)
    switch $cmd
        case fish
            set cmd 🐟
        case nvim
            set cmd 📝
        case man less
            set cmd 📖
        case git
            set cmd 🌿
        case curl wget ping
            set cmd 🌐
        case ssh
            set cmd 🖥️
        case cargo rustc
            set cmd 🦀
        case docker docker-compose
            set cmd 🐳
        case make meson cmake
            set cmd 🛠️
        case node
            set cmd 🌲
        case pacman paru
            set cmd 📦
    end
    echo "$cmd   $(prompt_pwd)"
end
