function warn -d 'Log a warning message'
    set_color bryellow
    echo -n '[WARN]'
    set_color normal
    echo " $argv"
end
