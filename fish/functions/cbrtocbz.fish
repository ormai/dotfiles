function cbrtocbz -d 'Convert a comic book from RAR to ZIP'
    if test (count $argv) -lt 1
        echo 'Usage: cbr2cbz FILE.cbr...'
        return 1
    end

    function convert
        # unrar the .cbr, then create a .cbz with zip
        set -l name (path change-extension '' $argv[1])
        mkdir -p .$name
        and unrar e $argv[1] -o .$name
        and zip $name.cbz .$name/*
        and gio trash .$name $argv[1]
    end

    # `cbrtocbz *.cbr` works
    for file in $argv
        convert $file
    end
end
