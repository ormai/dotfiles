function transcode -d 'Transcode videos to av1 mkv'
    argparse d/dry-run h/help r/recursive -- $argv
    or return 1

    if set -q _flag_help
        echo Usage:
        echo "  $_ [options] files..."
        echo
        echo Options
        echo '  -d, --dry-run      list files that can be converted'
        echo '  -h, --help         show help usage'
        echo '  -r, --recursive    descend directories and search for videos to convert'
        return
    end

    if not set -q argv[1] && not set -q _flag_recursive
        echo "Usage: $_ [options] files..."
        return 1
    end

    if set -q _flag_recursive
        set -f files **/*.{mp4,m4a,mov,m4v,wmv,mkv,ts,mpg,avi,mp2,flv}
    else
        set -f files $argv
    end

    function should_be_converted -d 'Determine if a file should be transcoded'
        # https://stackoverflow.com/a/33700000/15481080
        set -l codec (ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 -i $argv[1] 2>/dev/null)
        if test -z "$codec"
            warn "Could not retrieve codec for '$argv[1]'"
            return 0
        end
        return (test $codec != av1)
    end

    if set -q _flag_dry_run
        for file in $files
            should_be_converted $file
            and echo $file
        end
        return 0
    end

    function convert
        set -l output (path dirname $argv[1])/.ffmpeg_(path change-extension mkv (path basename $argv[1]))
        set -l size_before (du -h $argv[1] | cut -d \t -f 1)
        set -l size_before_KiB (du $argv[1] | cut -d \t -f 1)
        set -l start_time (date +%s)
        # Transcodig is lossy.
        # TODO: silence svtav1
        ffmpeg -y -hide_banner -i $argv[1] -c:v libsvtav1 -svtav1-params progress=0 -c:a libopus $output
        and info "encoded '$argv[1]', $size_before -> $(du -h $output | cut -d \t -f 1)," \
            "factor $(math $size_before_KiB / $(du $output | cut -d \t -f 1))," \
            "in $(math (date +%s) - $start_time | awk '{printf "%02d:%02d:%02d\n", $1/3600, ($1%3600)/60, $1%60}')"
        # and gio trash $argv[1] # Original file is not lost
        and mv $output (string replace .ffmpeg_ '' $output)
    end

    for file in $files
        if should_be_converted $file
            convert $file
        end
    end
end
