function pacman-remove --description 'Remove packages interactively'
  # -m enables multi select with tab/shift-tab
  if set -l packages (pacman -Qq | fzf -m --preview 'pacman -Qi {}')
    sudo pacman -Rscn $packages
  end
end
