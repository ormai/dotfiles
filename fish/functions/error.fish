function error -d 'Log an error message'
    set_color brred
    echo -n '[ERROR]'
    set_color normal
    echo " $argv"
end
