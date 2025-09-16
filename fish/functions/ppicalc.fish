function ppicalc -a width_px height_px diagonal_in
    test (count $argv) -eq 3
    or echo "Usage: $_ width-px height-px diagonal-in" && return 1

    echo -n 'Pixels per inch: '
    set_color cyan --bold
    set -l dpi (math --scale=2 "sqrt($width_px * $width_px + $height_px * $height_px) / $diagonal_in")
    echo -n $dpi

    set_color normal
    echo -n ' ('
    set_color yellow
    if test $dpi -lt 120
        echo -n ldpi
    else if test $dpi -lt 160
        echo -n mpdi
    else if test $dpi -lt 213
        echo -n tvdpi
    else if test $dpi -lt 240
        echo -n hdpi
    else if test $dpi -lt 320
        echo -n xhdpi
    else if test $dpi -lt 480
        echo -n xxhdpi
    else if test $dpi -lt 640
        echo -n xxxhdpi
    else
        set_color red --bold
        echo -n out of scale value
    end
    set_color normal
    echo \)
end
