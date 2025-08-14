function backup -d 'Backup ~ with restic to a sftp location'
    notify-send -a 'Automatic backup' -i drive-harddisk 'Backup started'
    set -l output (systemd-inhibit --why='Home backup' \
            restic backup \
            --repo sftp:server:ssd/arch-t470 \
            --password-command='secret-tool lookup service restic_backup' \
            --exclude='**/*cache*' \
            --exclude='**/*Cache*' \
            --exclude='**/.var' \
            --exclude='**/.local/share/gnome-boxes' \
            --exclude='**/.local/share/rustup' \
            --exclude='**/Downloads' \
            --exclude='**/Trash' \
            /home/mario | tail -6 | head -5)
    notify-send -a 'Automatic backup' -i drive-harddisk 'Backup completed' "$output"

    # see also ~/.config/systemd/user/backup.service
    #      and ~/.config/systemd/user/backup.timer
end
