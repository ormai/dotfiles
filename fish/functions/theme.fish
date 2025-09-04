function theme -d "Change terminal theme"
    # Update colorscheme of for all pts devices in /dev/pts/[0-9]
    # https://codeberg.org/dnkl/foot/wiki#dynamic-color-changes

    if test (count $argv) -ne 1 || not string match -qr '^(?:light|dark)$' $argv[1]
        echo "Usage: $_ light|dark"
        return 1
    end

    if test "$argv[1]" = light
        set -f BG '#f9f5d7'
        set -f FG '#504945'
        set -f PALETTE '#bdae93 #9d0006 #79740e #b57614 #076678 #8f3f71 #427b58
      #504945 928374 #9d0006 #79740e #b57614 #076678 #8f3f71 #427b58 #282828'
    else
        set -f BG '#1d2021'
        set -f FG '#ebdbb2'
        set -f PALETTE '#3c3836 #cc241d #98971a #d79921 #458588 #b16286 #689d6a
      #a89984 928374 #fb4934 #b8bb26 #fabd2f #83a598 #d3869b #8ec07c #fbf1c7'
    end

    printf "\033]10;$FG\007" | tee '/dev/pts/[0-9]+' 2>/dev/null # foreground
    printf "\033]11;$BG\007" | tee '/dev/pts/[0-9]+' 2>/dev/null # background
    printf "\033]12;$FG\007" | tee '/dev/pts/[0-9]+' 2>/dev/null # cursor

    set -l i 0
    for color in $PALETTE
        printf "\033]4;$i;$color\007" | tee '/dev/pts/[0-9]+' 2>/dev/null
        set i (math $i + 1)
    end
end
