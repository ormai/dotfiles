function tohevc -d 'Encode videos to HEVC/x265 mp4'
    set -l options d/dry-run h/help r/recursive
    argparse $options -- $argv
    or return

    if set -q _flag_help
        echo Usage:
        echo "  $_ [options] files..."
        echo
        echo Options
        echo '  -d, --dry-run      list files that can be converted'
        echo '  -h, --help         show help usage'
        echo '  -r, --recursive    descend directories and search for videos to convert'
        return 0
    end

    if not set -q argv[1] && not set -q _flag_recursive
        echo 'Usage: tohevc [options] files...'
        return 1
    end

    if set -q _flag_recursive
        set -f files **/*.{mp4,m4a,mov,m4v,wmv,mkv}
    else
        set -f files $argv
    end

    function should_be_converted -d 'Determine if a file should be converted to HEVC'
        set -l compressor_id (exiftool -b -CompressorID $argv[1] 2>/dev/null)
        if test -z "$compressor_id"
            echo "[WARN] '$argv[1]' has no CompressorID"
            return 1
        end
        return (test $compressor_id != hev1 && test $compressor_id != hvc1)
    end

    if set -q _flag_dry_run
        for file in $files
            if should_be_converted $file
                echo $file
            end
        end
        return 0
    end

    function convert
        set -l output (path dirname $argv[1])/.hevc_(path change-extension mp4 (path basename $argv[1]))
        set -l size_before (du -h $argv[1] | cut -d \t -f 1)
        set -l size_before_KiB (du $argv[1] | cut -d \t -f 1)
        set -l start_time (date +%s)
        ffmpeg -y -nostats -hide_banner -loglevel error -i $argv[1] -c:v libx265 -vtag hvc1 \
            -x265-params "log-level=warning" $output
        and echo "[INFO] Encoded '$argv[1]', $size_before -> $(du -h $output | cut -d \t -f 1)," \
            "factor $(math $size_before_KiB / $(du $output | cut -d \t -f 1))," \
            "in $(math (date +%s) - $start_time | awk '{printf "%02d:%02d:%02d\n", $1/3600, ($1%3600)/60, $1%60}')"
        and gio trash $argv[1] # I usually refrain from removing files directly
        and mv $output (string replace .hevc_ '' $output)
    end

    for file in $files
        if should_be_converted $file
            convert $file
        end
    end
end
