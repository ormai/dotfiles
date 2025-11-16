function exercism --wraps exercism
    # Changes directory to new exercise after dowloading it
    set -l out (command exercism $argv)
    echo $out
    if test $argv[1] = download && $out[-1]
        cd $out[-1] || return 1
    end
end
