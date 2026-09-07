function meson-uninstall -d 'Uninstall a program installed with meson by reading the install-log.txt'
    for file in (grep -v '^#' build/meson-logs/install-log.txt)
        gio trash $file
    end
end
