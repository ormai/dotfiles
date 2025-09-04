function backup -d 'Backup ~ with restic to a sftp location'
    set -l output (systemd-inhibit --why='Home backup' \
        restic backup \
        --json --quiet \
        --repo sftp:server:ssd/arch-t470 \
        --password-command='secret-tool lookup service restic_backup' \
        --exclude='**/*cache*' \
        --exclude='**/*Cache*' \
        --exclude='**/.var' \
        --exclude='**/.local/share/gnome-boxes' \
        --exclude='**/.local/share/rustup' \
        --exclude='**/Downloads' \
        --exclude='**/Trash' \
        $HOME
    )

    set -f urgency critical
    set -f summary 'Unexpected output'
    set -f body "Here's the full output $output"
    switch (echo $output | jq -r .message_type)
        case summary
            set urgency low # Not shown on screen but left in the drawer
            set summary 'Backup completed'
            set body "$(math (echo $output | jq -r .files_new) + (echo $output | jq -r .files_changed)) files, $(echo (string split ' ≈ ' (qalc -s 'prec 2' (echo $output | jq -r .data_added) bytes))[2]), in $(echo $output | jq -r .total_duration | awk '{printf "%02d:%02d:%02d\n", $1/3600, ($1%3600)/60, $1%60}')" # *chef's kiss*
        case exit_error
            set summary 'Backup failed'
            set body (echo $output | jq -r .message)
    end

    notify-send -a Backup -i drive-harddisk -u $urgency "$summary" "$body"

    # see also ~/.config/systemd/user/backup.service
    #      and ~/.config/systemd/user/backup.timer
end
