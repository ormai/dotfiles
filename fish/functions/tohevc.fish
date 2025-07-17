function tohevc -d 'Encode videos to HEVC/x265 mp4'
    set -l options d/dry-run h/help r/recursive
    argparse -n tohevc $options -- $argv
    or return

    if set -q _flag_help
        echo Usage:
        echo '  tohevc [options] files...'
        echo
        echo Options
        echo '  -d, --dry-run      list files that can be converted'
        echo '  -h, --help         show usage help'
        echo '  -r, --recursive    descend directories and search for videos to convert'
        return 0
    end

    if not set -q argv[1] && not set -q _flag_recursive
        echo 'Usage: tohevc [options] files...'
        return 1
    end

    if set -q _flag_recursive
        set -f files **/*.{mp4,m4a,mov}
    else
        set -f files $argv
    end

    function should_be_converted -d 'Search for MP4s that that do not use HEVC'
        set -l compressor_id (exiftool -b -CompressorID $argv[1] 2>/dev/null)

        if test -z "$compressor_id"
            echo "Skipping '$argv[1]' because it has no CompressorID"
            return 1
        end

        if test $compressor_id != hev1 && test $compressor_id != hvc1
            return 0
        end
        return 1
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
        ffmpeg -i $argv[1] -c:v libx265 -vtag hvc1 $output
        and gio trash $argv[1]
        and mv $output (string replace .hevc_ '' $output)
    end

    for file in $files
        if should_be_converted $file
            convert $file
        else
            echo "Skipping '$file' because it is already encoded with HEVC"
        end
    end
end
