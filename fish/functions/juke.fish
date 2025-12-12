function juke --description 'Music library management helpers'
    argparse h/help l/add-lyrics r/recursive -- $argv
    or return

    if set -q _flag_help
        echo Usage:
        echo "  $_ [options] files..."
        echo
        echo Options:
        echo '  -h, --help         show help usage'
        echo '  -l, --add-lyrics   download synced lyrics for files'
        echo '  -r, --recursive    descend recusively in directories'
        return
    end

    # TODO: handle more than one input file
    set -f target $argv[1]
    test (count $argv) -gt 0
    or set target .
    test -e $target
    or begin
        error "$target does not exist"
        return 1
    end

    if test -d $target
        if set -q _flag_recursive
            set target $target/**/*.{mp3,flac}
        else
            set target $target/*.{mp3,flac}
        end
    end

    function lrclib -a song --description 'Download synced lyrics for a song'
        # https://lrclib.net/docs
        # Takes a relative path to an mp3 file
        # Creates a file with the same base path of the mp3 but with lrc extension

        set -l lrc_file (path change-extension lrc $song)
        test -f $lrc_file
        and return # synced lyrics found
        set -l txt_file (path change-extension txt $song)
        test -f $txt_file
        and return # plain lyrics found

        set sig (string split ';' (exiftool -b -p '$Artist;$Title;$Album;$Duration' $song))
        set -l res (curl -s -G \
                        --data-urlencode artist_name=$sig[1] \
                        --data-urlencode track_name=$sig[2] \
                        --data-urlencode album_name=$sig[3] \
                        -d duration=(math round $sig[4]) \
                        https://lrclib.net/api/get)

        set -l synced_lyrics "$(echo $res | jq -r .syncedLyrics)"
        if test $synced_lyrics = null
            set -l plain_lyrics "$(echo $res | jq -r .plainLyrics)"
            if test $plain_lyrics = null
                printf "info: no lyrics found for $song"
                test "$(echo $res | jq -r .instrumental)" = true
                and set_color cyan && printf ' (instrumental)' && set_color normal
                echo
            else
                echo "$plain_lyrics" >$txt_file
                info "downloaded plain lyrics: $txt_file"
            end
        else
            echo "$synced_lyrics" >$lrc_file
            info "downloaded synced lyrics: $lrc_file"
        end
    end

    if set -q _flag_add_lyrics
        for file in $target
            lrclib $file
        end
    else # default to checking
        # Songs should be mp3 files with a bit rate of 320 Kbps, accompanied by lyrics
        for file in $target
            set -l low_bitrate (test (exiftool $file -b -AudioBitrate) -lt 320000
                                and echo true; or echo false)
            set -l has_no_lyrics (! test -f (path change-extension lrc $file) \
                                  && ! test -f (path change-extension txt $file)
                                  and echo true; or echo false)
            if $low_bitrate || $has_no_lyrics
                printf "$file "
                $low_bitrate
                and set_color yellow --bold && printf 'bit rate is not 320 Kbps '
                $has_no_lyrics
                and set_color magenta --bold && printf 'has no lyrics'
                echo
                set_color normal
            end
        end
    end
end
