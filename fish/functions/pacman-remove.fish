function pacman-remove -d 'Remove packages interactively'
    # -m enables multi select with tab/shift-tab
    if set -l packages (pacman -Qq | fzf -m --preview 'pacman -Qi {}')
        paru -Rscn $packages
    end
end
