function cbrtocbz -d 'Convert a comic book from RAR to ZIP'
    if test (count $argv) -lt 1
        echo "Usage: $_ files..."
        return 1
    end

    for file in $argv
        # unrar the .cbr, then create a .cbz with zip
        set -l name (path change-extension '' $file)
        mkdir -p .$name
        and unrar e $file -o .$name
        and zip $name.cbz .$name/*
        and gio trash .$name $file
    end
end
