function theme -d "Change terminal theme"
    # Update colorscheme of running instances of foot
    # org.gnome.desktop.interface color-scheme
    # <https://codeberg.org/dnkl/foot/wiki#dynamic-color-changes>

    if test "$argv[1]" = light
        set -f BG '#fafafa'
        set -f FG '#504945'
        set -f PALETTE '#bdae93 #9d0006 #79740e #b57614 #076678 #8f3f71 #427b58
      #504945 928374 #9d0006 #79740e #b57614 #076678 #8f3f71 #427b58 #282828'
    else
        set -f BG '#1d2021'
        set -f FG '#ebdbb2'
        set -f PALETTE '#3c3836 #cc241d #98971a #d79921 #458588 #b16286 #689d6a
      #a89984 928374 #fb4934 #b8bb26 #fabd2f #83a598 #d3869b #8ec07c #fbf1c7'
    end

    echo -en "\033]10;$FG\007" | tee '/dev/pts/[0-9]*' 2>/dev/null # foreground
    echo -en "\033]11;$BG\007" | tee '/dev/pts/[0-9]*' 2>/dev/null # background
    #printf "\033]12;%s\007" "$3" | tee /dev/pts/[0-9]* # cursor

    set -l i 0
    for color in $PALETTE
        echo -en "\033]4;$i;$color\007" | tee '/dev/pts/[0-9]*' 2>/dev/null
        set i (math $i + 1)
    end
end
