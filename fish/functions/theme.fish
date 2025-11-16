function theme --description "Change terminal theme"
    # Update colorscheme of for all pts devices in /dev/pts/[0-9]
    # https://codeberg.org/dnkl/foot/wiki#dynamic-color-changes

    argparse h/help l/list-themes -- $argv
    or return 1

    function usage
        echo "Usage: $_ [options] [theme]"
        echo
        echo 'Options:'
        echo '  -h, --help          Print help'
        echo '  -l, --list-themes   List available themes'
    end

    if set -q _flag_help
        usage
        return
    end

    if set -q _flag_list_themes
        echo gruvbox-dark-hard
        echo gruvbox-light-hard
        return
    end

    test (count $argv) -eq 1
    or usage && return 1

    set -l background
    set -l foreground
    set -l palette
    switch $argv[1]
        case gruvbox-dark-hard
            set background '#1d2021'
            set foreground '#ebdbb2'
            set palette '#3c3836 #cc241d #98971a #d79921 #458588 #b16286 #689d6a
      #a89984 928374 #fb4934 #b8bb26 #fabd2f #83a598 #d3869b #8ec07c #fbf1c7'
        case gruvbox-light-hard
            set background '#f9f5d7'
            set foreground '#504945'
            set palette '#bdae93 #9d0006 #79740e #b57614 #076678 #8f3f71 #427b58
      #504945 928374 #9d0006 #79740e #b57614 #076678 #8f3f71 #427b58 #282828'
        case '*'
            echo "Unknown theme '$argv[1]', use --list-themes to see available themes"
            return 1
    end

    printf "\033]10;$foreground\007" | tee '/dev/pts/[0-9]+' 2>/dev/null # foreground
    printf "\033]11;$background\007" | tee '/dev/pts/[0-9]+' 2>/dev/null # background
    printf "\033]12;$foreground\007" | tee '/dev/pts/[0-9]+' 2>/dev/null # cursor

    set -l i 0
    for color in $palette
        printf "\033]4;$i;$color\007" | tee '/dev/pts/[0-9]+' 2>/dev/null
        set i (math $i + 1)
    end
end
