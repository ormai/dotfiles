function meltdown -d 'Melt your computer'
    function int --on-signal INT
        kill (jobs -p)
    end

    for i in /dev/cpu/*
        cat /dev/zero >/dev/null &
    end
    echo 'Press CTRL+C to stop'
    wait
end
