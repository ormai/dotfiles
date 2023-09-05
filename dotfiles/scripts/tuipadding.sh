#!/bin/bash

# This is a wrapper scripts called through aliases whenever a tui program is
# run by kitty.
# Normally kitty is configured to have some `window_width_padding`, but when
# running some program like nvim such padding should disappear.

# Solution found here <https://www.reddit.com/r/vim/comments/ofe72k/disabling_terminal_padding_while_using_vim/>

kitty @ set-spacing padding=0
$@ # like a sandwich
kitty @ set-spacing padding=5 # restore padding on quit
