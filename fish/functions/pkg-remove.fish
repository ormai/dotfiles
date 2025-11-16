function pkg-remove --description 'Remove packages interactively'
    if set -l packages (paru -Qq | fzf --multi --preview 'paru -Qi {}')
        paru -Rscn $packages
    end
end
