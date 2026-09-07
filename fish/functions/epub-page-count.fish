function epub-page-count -d 'Counts the pages in en epub file'
    argparse w/wpp= -- $argv || return

    # Defaults to 280 words per page
    set -l wpp 260
    if set -q _flag_wpp
        set wpp _flag_wpp
    end

    if not set -q argv[1]
        echo 'Please provide a file'
        return 1
    end

    file --mime $argv[1] | grep -q 'application/epub+zip'
    or echo 'The provided file is not EPUB' && return 1

    set -l word_count (unzip -p $argv[1] '*.xhtml' | sed 's/<[^>]*>//g' | wc -w)
    math "ceil($word_count / $wpp)"
end
