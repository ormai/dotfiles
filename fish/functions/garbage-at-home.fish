function garbage-at-home -d 'List things that should not be in $HOME'
    for file in (command ls -A $HOME)
        ! grep -q $file ~/.config/user-dirs.dirs && ! string match -qr '\.config|\.cache|\.local' $file
        and echo $file
    end
end
