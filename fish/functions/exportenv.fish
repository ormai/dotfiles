function exportenv -d 'Export NAME=VALUE variables from files'
    # Useful to export all the variables in a .env to the shell environment.
    # I use this in ~/.config/fish/env.fish to export
    # ~/.config/user-dirs.dirs and ~/.config/locale.conf

    if test (count $argv) -lt 1
        echo "Usage: $_ var-files..."
    end

    for file in $argv
        for line in (grep -v -e '^\s*#' -e '^\s*$' $file)
            string match -qr '^(?:export\s+)?(?<name>\w+)=(?<value>\N+)' $line
            set -l expanded_value (eval echo $value)
            if test $name = PATH
                fish_add_path $expanded_value
            else
                set -gx "$name" $expanded_value
            end
        end
    end
end
