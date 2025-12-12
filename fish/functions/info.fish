# Nobody uses GNU Info anyway
function info -d 'Log a message'
    set_color brgreen
    echo -n '[INFO]'
    set_color normal
    echo " $argv"
end
