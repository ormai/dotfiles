function cbrtocbz -d 'Convert a comic book archive from RAR to ZIP'
    if test (count $argv) -lt 1
        echo "Usage: $_ files..."
        return 1
    end

    # Extracts the .cbr with unrar, then creates a .cbz with zip
    function convert -a file
        set -l workdir (mktemp -d)
        and unrar e $file -o $workdir
        and zip (path change-extension 'cbz' $file) $workdir/*
        and gio trash $file # Original file is not lost 
        and rm -r $workdir
    end

    for file in $argv
        if test -f $file && test (path extension $file) = .cbr
            convert $file
        else
            echo "[WARN] skipping '$file': it is not a valid comic book RAR archive"
        end
    end
end
