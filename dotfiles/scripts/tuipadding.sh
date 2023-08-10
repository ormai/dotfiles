#!/bin/bash

# This is a wrapper scripts called through aliases whenever a tui program is
# run by kitty.
# Normally kitty is configured by having some `window_width_paddgin`, but when
# running some program that uses a terminal user interface it's no longer
# needed.

# Solution found here <https://www.reddit.com/r/vim/comments/ofe72k/disabling_terminal_padding_while_using_vim/>

kitty @ set-spacing padding=0
$@
kitty @ set-spacing padding=5 # restore padding on quit
