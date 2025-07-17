# https://github.com/faho/fish-snippets/blob/main/functions/poggress.fish

function poggress --description "Display a progress bar"
    set -l width $COLUMNS
    # With -w WIDTH, format bar to given width (default is $COLUMNS)
    # With -c CHAR, use that to end the progress bar (default is "#")
    argparse w/width= c/char= -- $argv
    or return
    set -ql _flag_w
    and set width $_flag_w[-1]
    set -l char '>'
    set -ql _flag_c
    and set char $_flag_c[-1]

    set -l read 0
    if not set -q argv[1]; and not isatty stdin
        set read 1
    end
    set -l perc
    while if test $read = 1
        read perc
    else
        set -q argv[1]; and set perc $argv[1]; and set -e argv[1]
    end
        # We do percent, so we pad the number + the % to 5 cells,
        # and we always use at least one '#' (string pad doesn't *remove* characters when width is 0)
        set -l fill (math -s0 max 1, min $width x "($perc / 100)", $width - 5)

        # (this is the actual number padding
        set perc (string pad -w 5 -c ' ' $perc%)

        set -l bar (string pad -w $fill -c '=' $char)

        # Rest of the width gets spaces and then foo%
        set -l percwidth (math -s0 $width - $fill)
        set -l percent (string pad -w $percwidth -c ' ' $perc)

        printf %s $bar $percent
    end
end

# for i in (seq 100)
#     poggress $i
#     printf \r
#     sleep 0.02
# end; and echo \nDone!
