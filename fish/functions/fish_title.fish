function fish_title
    set -l cmd (status current-command)
    set -l icon
    switch $cmd
        case fish
            set icon 🐟
        case helix hx
            set icon 🧬
        case man
            set icon 📖
        case git
            set icon 🌿
        case curl wget ping
            set icon 🌐
        case ssh
            set icon 🖥️
        case cargo rustc rustup
            set icon 🦀
        case docker docker-compose
            set icon 🐳
        case make cmake meson ninja ./mach
            set icon 🛠️
        case gradle ./gradlew psql
            set icon 🐘
        case mvn ./mvnw
            set icon 🪶
        case node npm pnpm
            set icon 🌲
        case pacman paru
            set icon 📦
    end
    echo "$icon  $cmd"
end
