# IMPORTANT!!!
#
# When defining your own bindings using fish_helix_command, be aware that it can break
# stuff sometimes.
#
# It is safe to define a binding consisting of a lone call to fish_helix_command.
# Calls to other functions and executables are allowed along with it, granted they don't mess
# with fish's commandline buffer.
#
# Mixing multiple fish_helix_commandline and commandline calls in one binding MAY trigger issues.
# Nothing serious, but don't be surprised. Just test it.

function fish_helix_key_bindings --description 'helix-like key bindings for fish'
    if contains -- -h $argv
        or contains -- --help $argv
        echo "Sorry but this function doesn't support -h or --help"
        return 1
    end

    # Erase all bindings if not explicitly requested otherwise to
    # allow for hybrid bindings.
    # This needs to be checked here because if we are called again
    # via the variable handler the argument will be gone.
    set -l rebind true
    if test "$argv[1]" = --no-erase
        set rebind false
        set -e argv[1]
    else
        bind --erase --all --preset # clear earlier bindings, if any
    end

    # Allow just calling this function to correctly set the bindings.
    # Because it's a rather discoverable name, users will execute it
    # and without this would then have subtly broken bindings.
    if test "$fish_key_bindings" != fish_helix_key_bindings
        and test "$rebind" = true
        # Allow the user to set the variable universally.
        set -q fish_key_bindings
        or set -g fish_key_bindings
        # This triggers the handler, which calls us again and ensures the user_key_bindings
        # are executed.
        set fish_key_bindings fish_helix_key_bindings
        return
    end

    set -l init_mode insert

    if contains -- $argv[1] insert default visual
        set init_mode $argv[1]
    else if set -q argv[1]
        # We should still go on so the bindings still get set.
        echo "Unknown argument $argv" >&2
    end

    # Inherit shared key bindings.
    # Do this first so helix-bindings win over default.
    for mode in insert default visual
        __fish_shared_key_bindings -s -M $mode
    end

    bind -s --preset -M insert \r execute
    bind -s --preset -M insert \n execute

    bind -s --preset -M insert "" self-insert

    # Space and other command terminators expand abbrs _and_ inserts itself.
    bind -s --preset -M insert " " self-insert expand-abbr
    bind -s --preset -M insert ";" self-insert expand-abbr
    bind -s --preset -M insert "|" self-insert expand-abbr
    bind -s --preset -M insert "&" self-insert expand-abbr
    bind -s --preset -M insert "^" self-insert expand-abbr
    bind -s --preset -M insert ">" self-insert expand-abbr
    bind -s --preset -M insert "<" self-insert expand-abbr
    # Closing a command substitution expands abbreviations
    bind -s --preset -M insert ")" self-insert expand-abbr
    # Ctrl-space inserts space without expanding abbrs
    bind -s --preset -M insert -k nul 'commandline -i " "'

    # Switching to insert mode
    for mode in default visual
        bind -s --preset -M $mode -m insert \cc end-selection cancel-commandline repaint-mode
        bind -s --preset -M $mode -m insert \n end-selection execute
        bind -s --preset -M $mode -m insert \r end-selection execute
        bind -s --preset -M $mode -m insert o end-selection insert-line-under repaint-mode
        bind -s --preset -M $mode -m insert O end-selection insert-line-over repaint-mode
        # FIXME i/a should keep selection, maybe
        bind -s --preset -M $mode i "fish_helix_command insert_mode"
        bind -s --preset -M $mode I "fish_helix_command prepend_to_line"
        bind -s --preset -M $mode a "fish_helix_command append_mode"
        bind -s --preset -M $mode A "fish_helix_command append_to_line"
    end

    # Switching from insert mode
    # Note if we are paging, we want to stay in insert mode
    # See #2871
    bind -s --preset -M insert \e "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f begin-selection repaint-mode; end"

    # Switching between normal and visual mode
    bind -s --preset -M default -m visual v repaint-mode
    for key in v \e
        bind -s --preset -M visual -m default $key repaint-mode
    end

    # Motion and actions in normal/select mode
    for mode in default visual
        if test $mode = default
            set -f n_begin_selection begin-selection # only begin-selection if current mode is Normal
            set -f ns_move_extend move
            set -f commandline_v_repaint ""
        else
            set -f n_begin_selection
            set -f ns_move_extend extend
            set -f commandline_v_repaint "commandline -f repaint-mode"
        end

        for key in (seq 0 9)
            bind -s --preset -M $mode $key "fish_bind_count $key"
            # FIXME example to bind 0
            # FIXME backspace to edit count
        end
        for key in h \e\[D \eOD "-k left"
            bind -s --preset -M $mode $key "fish_helix_command "$ns_move_extend"_char_left"
        end
        for key in l \e\[C \eOC "-k right"
            bind -s --preset -M $mode $key "fish_helix_command "$ns_move_extend"_char_right"
        end
        for key in k \e\[A \eOA "-k up"
            bind -s --preset -M $mode $key "fish_helix_command char_up"
        end
        for key in j \e\[B \eOB "-k down"
            bind -s --preset -M $mode $key "fish_helix_command char_down"
        end

        bind -s --preset -M $mode w "fish_helix_command next_word_start"
        bind -s --preset -M $mode b "fish_helix_command prev_word_start"
        bind -s --preset -M $mode e "fish_helix_command next_word_end"
        bind -s --preset -M $mode W "fish_helix_command next_long_word_start"
        bind -s --preset -M $mode B "fish_helix_command prev_long_word_start"
        bind -s --preset -M $mode E "fish_helix_command next_long_word_end"

        bind -s --preset -M $mode t "fish_helix_command till_next_char"
        bind -s --preset -M $mode f "fish_helix_command find_next_char"
        bind -s --preset -M $mode T "fish_helix_command till_prev_char"
        bind -s --preset -M $mode F "fish_helix_command find_prev_char"

        bind -s --preset -M $mode t\e ""
        bind -s --preset -M $mode f\e ""
        bind -s --preset -M $mode T\e ""
        bind -s --preset -M $mode F\e ""

        for enter in \r \n
            bind -s --preset -M $mode t$enter "fish_helix_command till_next_cr"
            bind -s --preset -M $mode f$enter "fish_helix_command find_next_cr"
            bind -s --preset -M $mode T$enter "fish_helix_command till_prev_cr"
            bind -s --preset -M $mode F$enter "fish_helix_command find_prev_cr"
        end

        for key in gh \e\[H \eOH "-k home"
            bind -s --preset -M $mode $key "fish_helix_command goto_line_start"
        end
        for key in gl \e\[F \eOF "-k end"
            bind -s --preset -M $mode $key "fish_helix_command goto_line_end"
        end
        bind -s --preset -M $mode gs "fish_helix_command goto_first_nonwhitespace"
        bind -s --preset -M $mode gg "fish_helix_command goto_file_start"
        bind -s --preset -M $mode G "fish_helix_command goto_line"
        bind -s --preset -M $mode ge "fish_helix_command goto_last_line"

        # FIXME alt-. doesn't work with t/T
        # FIXME alt-. doesn't work with [ftFT][\n\r]
        bind -s --preset -M $mode \e. repeat-jump

        # FIXME reselect after undo/redo
        bind -s --preset -M $mode u undo begin-selection
        bind -s --preset -M $mode U redo begin-selection

        bind -s --preset -M $mode -m replace_one r repaint-mode

        # FIXME registers
        # bind -s --preset -M $mode y fish_clipboard_copy
        # bind -s --preset -M $mode P fish_clipboard_paste
        # bind -s --preset -M $mode R kill-selection begin-selection yank-pop yank

        bind -s --preset -M $mode -m default d "fish_helix_command delete_selection; $commandline_v_repaint"
        bind -s --preset -M $mode -m default \ed "fish_helix_command delete_selection_noyank; $commandline_v_repaint"
        bind -s --preset -M $mode -m insert c "fish_helix_command delete_selection; commandline -f end-selection repaint-mode"
        bind -s --preset -M $mode -m insert \ec "fish_helix_command delete_selection_noyank; commandline -f end-selection repaint-mode"

        bind -s --preset -M $mode -m default y "fish_helix_command yank"
        bind -s --preset -M $mode p "fish_helix_command paste_after"
        bind -s --preset -M $mode P "fish_helix_command paste_before"
        bind -s --preset -M $mode R "fish_helix_command replace_selection"

        bind -s --preset -M $mode -m default " y" "fish_clipboard_copy; $commandline_v_repaint"
        bind -s --preset -M $mode " p" "fish_helix_command paste_after_clip"
        bind -s --preset -M $mode " P" "fish_helix_command paste_before_clip"
        bind -s --preset -M $mode " R" "fish_helix_command replace_selection_clip"

        # FIXME keep selection
        bind -s --preset -M $mode ~ togglecase-selection
        # FIXME ` and \e`

        # FIXME .
        # FIXME < and >
        # FIXME =

        # FIXME \ca \cx
        # FIXME Qq

        ## Shell
        # FIXME

        ## Selection manipulation
        # FIXME & _

        bind -s --preset -M $mode \; begin-selection
        bind -s --preset -M $mode \e\; swap-selection-start-stop
        # FIXME \e:

        bind -s --preset -M $mode % "fish_helix_command select_all"

        # FIXME x X \ex
        # FIXME J
        # FIXME \cc

        ## Search
        # FIXME

        ## FIXME minor modes: g, m, space

        ## FIXME [ and ] motions
    end

    # FIXME should replace the whole selection
    # FIXME should be able to go back to visual mode
    bind -s --preset -M replace_one -m default '' delete-char self-insert backward-char repaint-mode
    bind -s --preset -M replace_one -m default \r 'commandline -f delete-char; commandline -i \n; commandline -f backward-char; commandline -f repaint-mode'
    bind -s --preset -M replace_one -m default \e cancel repaint-mode

    ## FIXME Insert mode keys

    ## Old config from vi:

    # Vi moves the cursor back if, after deleting, it is at EOL.
    # To emulate that, move forward, then backward, which will be a NOP
    # if there is something to move forward to.
    bind -s --preset -M insert -k dc delete-char forward-single-char backward-char
    bind -s --preset -M default -k dc delete-char forward-single-char backward-char

    # Backspace deletes a char in insert mode, but not in normal/default mode.
    bind -s --preset -M insert -k backspace backward-delete-char
    bind -s --preset -M default -k backspace backward-char
    bind -s --preset -M insert \ch backward-delete-char
    bind -s --preset -M default \ch backward-char
    bind -s --preset -M insert \x7f backward-delete-char
    bind -s --preset -M default \x7f backward-char
    bind -s --preset -M insert -k sdc backward-delete-char # shifted delete
    bind -s --preset -M default -k sdc backward-delete-char # shifted delete

    #    bind -s --preset '~' togglecase-char forward-single-char
    #    bind -s --preset gu downcase-word
    #    bind -s --preset gU upcase-word
    #
    #    bind -s --preset J end-of-line delete-char
    #    bind -s --preset K 'man (commandline -t) 2>/dev/null; or echo -n \a'
    #

    # same vim 'pasting' note as upper
    bind -s --preset '"*p' forward-char "commandline -i ( xsel -p; echo )[1]"
    bind -s --preset '"*P' "commandline -i ( xsel -p; echo )[1]"

    #
    # visual mode
    #

    # bind -s --preset -M visual -m insert c kill-selection end-selection repaint-mode
    # bind -s --preset -M visual -m insert s kill-selection end-selection repaint-mode
    bind -s --preset -M visual -m default '"*y' "fish_clipboard_copy; commandline -f end-selection repaint-mode"
    bind -s --preset -M visual -m default '~' togglecase-selection end-selection repaint-mode

    # Set the cursor shape
    # After executing once, this will have defined functions listening for the variable.
    # Therefore it needs to be before setting fish_bind_mode.
    fish_vi_cursor
    set -g fish_cursor_selection_mode inclusive

    # set fish_bind_mode $init_mode

    # FIXME this can't be called in sequence in general case,
    # because of unsynchronized `commandline -f` and `commandline -C`
    function fish_helix_command
        argparse h/help -- $argv
        or return 1
        if test -n "$_flag_help"
            echo "Helper function to handle modal key bindings mostly outside of insert mode"
            return
        end

        # TODO only single command allowed really yet,
        #     because `commandline -f` queues actions, while `commandline -C` is immediate
        for command in $argv
            set -f count (fish_bind_count -r)
            set -f count_defined $status

            switch $command
                case {move,extend}_char_left
                    commandline -C (math max\(0, (commandline -C) - $count\))
                    __fish_helix_extend_by_command $command
                case {move,extend}_char_right
                    commandline -C (math (commandline -C) + $count)
                    __fish_helix_extend_by_command $command

                case char_up
                    __fish_helix_char_up $fish_bind_mode $count
                case char_down
                    __fish_helix_char_down $fish_bind_mode $count

                case next_word_start
                    # https://regex101.com/r/KXrl1x/1
                    set -l regex (string join '' \
            '(?:.?\\n+|' \
            '[[:alnum:]_](?=[^[:alnum:]_\\s])|' \
            '[^[:alnum:]_\\s](?=[[:alnum:]_])|' \
            '[^\\S\\n](?=[\\S\\n])|)' \
            '((?:[[:alnum:]_]+|[^[:alnum:]_\\s]+|)[^\\S\\n]*)' \
            )
                    __fish_helix_next_word $fish_bind_mode $count $regex

                case next_long_word_start
                    set -l regex (string join '' \
            '(?:.?\\n+|' \
            '[^\\S\\n](?=[\\S\\n])|)' \
            '(\\S*[^\\S\\n]*)' \
            )
                    __fish_helix_next_word $fish_bind_mode $count $regex

                case next_word_end
                    # https://regex101.com/r/Gl0KP2/1
                    set -l regex ' (?:
                .?\\n+ |
                [[:alnum:]_](?=[^[:alnum:]_]) |
                [^[:alnum:]_\\s](?=[[:alnum:]_\\s]) | )
            ( [^\\S\\n]*
                (?: [[:alnum:]_]+ | [^[:alnum:]_\\s]+ | ) ) '
                    __fish_helix_next_word $fish_bind_mode $count $regex

                case next_long_word_end
                    set -l regex ' (?: .?\\n+ | \\S(?=\\s) | )
            ( [^\\S\\n]* \\S* ) '
                    __fish_helix_next_word $fish_bind_mode $count $regex

                case prev_word_start
                    set -l regex ' ( (?:
                [[:alnum:]_]+ |
                [^[:alnum:]_\\s]+ | )
            [^\\S\\n]* )
            (?: \\n+.? |
                (?<=[^[:alnum:]_])[[:alnum:]_] |
                (?<=[[:alnum:]_\\s])[^[:alnum:]_\\s] | ) '
                    __fish_helix_prev_word $fish_bind_mode $count $regex

                case prev_long_word_start
                    set -l regex '
            ( \\S* [^\\S\\n]* )
            (?: \\n+.? | (?<=\\s)\\S | ) '
                    __fish_helix_prev_word $fish_bind_mode $count $regex

                case till_next_char
                    __fish_helix_find_char $fish_bind_mode $count forward-jump-till forward-char
                case find_next_char
                    __fish_helix_find_char $fish_bind_mode $count forward-jump
                case till_prev_char
                    __fish_helix_find_char $fish_bind_mode $count backward-jump-till backward-char
                case find_prev_char
                    __fish_helix_find_char $fish_bind_mode $count backward-jump

                case till_next_cr
                    __fish_helix_find_next_cr $fish_bind_mode $count 2
                case find_next_cr
                    __fish_helix_find_next_cr $fish_bind_mode $count 1
                case till_prev_cr
                    __fish_helix_find_prev_cr $fish_bind_mode $count 1
                case find_prev_cr
                    __fish_helix_find_prev_cr $fish_bind_mode $count 0

                case goto_line_start
                    commandline -f beginning-of-line
                    __fish_helix_extend_by_mode
                case goto_line_end
                    __fish_helix_goto_line_end
                    __fish_helix_extend_by_mode
                case goto_first_nonwhitespace
                    __fish_helix_goto_first_nonwhitespace
                    __fish_helix_extend_by_mode

                case goto_file_start
                    __fish_helix_goto_line $count
                case goto_line
                    if test "$count_defined" = 0 # if true
                        __fish_helix_goto_line $count
                    end
                case goto_last_line
                    commandline -f end-of-buffer beginning-of-line
                    __fish_helix_extend_by_mode

                case insert_mode
                    commandline -C (commandline -B)
                    set fish_bind_mode insert
                    commandline -f end-selection repaint-mode

                case append_mode
                    commandline -C (commandline -E)
                    set fish_bind_mode insert
                    commandline -f end-selection repaint-mode

                case prepend_to_line
                    __fish_helix_goto_first_nonwhitespace
                    set fish_bind_mode insert
                    commandline -f end-selection repaint-mode

                case append_to_line
                    set fish_bind_mode insert
                    commandline -f end-selection end-of-line repaint-mode

                case delete_selection
                    commandline -f kill-selection begin-selection
                case delete_selection_noyank
                    __fish_helix_delete_selection

                case yank
                    __fish_helix_yank
                case paste_before
                    __fish_helix_paste_before "commandline -f yank"
                case paste_after
                    __fish_helix_paste_after "commandline -f yank"
                case replace_selection
                    __fish_helix_replace_selection "$fish_killring[1]" true

                case paste_before_clip
                    __fish_helix_paste_before fish_clipboard_paste
                case paste_after_clip
                    __fish_helix_paste_after fish_clipboard_paste --clip
                case replace_selection_clip
                    __fish_helix_replace_selection "" fish_clipboard_paste --clip

                case select_all
                    commandline -f beginning-of-buffer begin-selection end-of-buffer end-of-line backward-char

                case '*'
                    echo "[fish-helix]" Unknown command $command >&2
            end
        end
    end

    function __fish_helix_extend_by_command -a piece
        if not string match -qr extend_ $piece
            commandline -f begin-selection
        end
    end

    function __fish_helix_extend_by_mode
        if test $fish_bind_mode = default
            commandline -f begin-selection
        end
    end

    function __fish_helix_find_char -a mode count fish_cmdline till
        # FIXME don't reset selection if N/A
        if test $mode = default
            commandline -f begin-selection
        end
        commandline -f $till $fish_cmdline
        for i in (seq 2 $count)
            commandline -f $till repeat-jump
        end
    end

    function __fish_helix_find_next_cr -a mode count skip
        set -l cursor (commandline -C)
        commandline | # Include endling newline intentionally
            # Skip until cursor:
            sed -z 's/^.\{'(math $cursor + $skip)'\}\(.*\)$/\\1/' |
            # Count characters up to the target newline:
            sed -z 's/^\(\([^\\n]*\\n\)\{0,'$count'\}\).*/\\1/' |
            read -zl chars

        if test $mode = default -a -n "$chars"
            commandline -f begin-selection
        end
        for i in (seq 1 (string length -- "$chars"))
            commandline -f forward-char
        end
    end

    function __fish_helix_find_prev_cr -a mode count skip
        set -l cursor (commandline -C)
        commandline --cut-at-cursor |
            sed -z 's/.\{'$skip'\}\n$//' |
            read -zl buffer

        echo -n $buffer |
            # Drop characters up to the target newline:
            sed -z 's/\(\(\\n[^\\n]*\)\{0,'$count'\}\)$//' |
            read -zl chars
        set -l n_chars (math (string length -- "$buffer") - (string length -- "$chars"))

        if test $mode = default -a $n_chars != 0
            commandline -f begin-selection
        end
        for i in (seq 1 $n_chars)
            commandline -f backward-char
        end
    end

    function __fish_helix_goto_line_end
        # check if we are on an empty line first
        commandline | sed -n (commandline -L)'!b;/^$/q;q5' && return
        commandline -f end-of-line backward-char
    end

    function __fish_helix_goto_first_nonwhitespace
        # check if we are on whitespace line first
        commandline | sed -n (commandline -L)'!b;/^\\s*$/q;q5' && return
        commandline -f beginning-of-line forward-bigword backward-bigword
    end

    function __fish_helix_goto_line -a number
        set -l lines (math min\($number, (commandline | wc -l)\))
        commandline -f beginning-of-buffer
        for i in (seq 2 $lines)
            commandline -f down-line
        end
        __fish_helix_extend_by_mode
    end

    function __fish_helix_char_up -a mode count
        if commandline --paging-mode && not commandline --search-mode
            for i in (seq 1 $count)
                commandline -f up-line
            end
            return
        end
        set -l line (commandline -L)
        if commandline --search-mode || test $line = 1
            for i in (seq 1 (math min \($count, (count $history)\)))
                commandline -f history-search-backward
            end
            return
        end
        set -l count (math min\($count, $line-1\))
        for i in (seq 1 $count)
            commandline -f up-line
        end
        __fish_helix_extend_by_mode
    end

    function __fish_helix_char_down -a mode count
        if commandline --paging-mode && not commandline --search-mode
            for i in (seq 1 $count)
                commandline -f down-line
            end
            return
        end
        set -l line (commandline -L)
        set -l total (count (commandline))
        if commandline --search-mode || test $line = $total
            for i in (seq 1 (math min \($count, (count $history)\)))
                commandline -f history-search-forward
            end
            return
        end
        set -l count (math min\($count, $total - $line\))
        for i in (seq 1 $count)
            commandline -f down-line
        end
        __fish_helix_extend_by_mode
    end

    function __fish_helix_next_word -a mode count regex
        set -f cursor (commandline -C)
        commandline |
            perl -e '
        use open qw(:std :utf8);
        do { local $/; substr <>, '$cursor' } =~ m/(?:'$regex'){0,'$count'}/ux;
        print $-[1], " ", $+[1];' |
            read -f left right
        test "$left" = "$right" && return
        if test $mode = default
            commandline -C (math $cursor + $left)
            commandline -f begin-selection
            for i in (seq $left (math $right - 2))
                commandline -f forward-char
            end
        else
            commandline -C (math $cursor + $right - 1)
        end
    end

    function __fish_helix_prev_word -a mode count regex
        set -f left (math (commandline -C) + 1)
        set -f updated 0
        for i in (seq 1 $count)
            commandline |
                perl -e '
            use open qw(:std :utf8);
            do { local $/; substr <>, 0, '$left' } =~ /(?:'$regex')$/ux;
            print $-[1], " ", $+[1];' |
                read -l l r
            test "$l" = "$r" -o "$l" = 0 -a "$r" = 1 && break
            set -f left $l
            set -f right $r
            set -f updated 1
        end
        test $updated -eq 0; and return
        if test $mode = default
            commandline -C (math $right - 1)
            commandline -f begin-selection
            for i in (seq $left (math $right - 2))
                commandline -f backward-char
            end
        else
            commandline -C (math $left)
        end
    end

    function __fish_helix_delete_selection
        set start (commandline -B)
        set end (commandline -E)
        commandline |
            sed -zE 's/^(.{'$start'})(.{0,'(math $end - $start)'})(.*)\\n$/\\1\\3/' |
            read -l result

        commandline "$result"
        commandline -C $start
        commandline -f begin-selection
    end

    function __fish_helix_yank
        set -l end (commandline -E)
        set -l cursor (commandline -C)
        commandline -f kill-selection yank backward-char

        for i in (seq $cursor (math $end - 2))
            commandline -f backward-char
        end
    end

    function __fish_helix_paste_before -a cmd_paste
        set -l cmd_paste $(string split " " $cmd_paste)
        set -l cursor (commandline -C)
        set -l start (commandline -B)
        set -l end (commandline -E)
        commandline -C $start
        $cmd_paste
        commandline -f begin-selection
        for i in (seq $start (math $end - 2))
            commandline -f forward-char
        end
        if test $cursor = $start
            commandline -f swap-selection-start-stop
        end
    end

    function __fish_helix_paste_after -a cmd_paste
        set -l cmd_paste $(string split " " $cmd_paste)
        set -l cursor (commandline -C)
        set -l start (commandline -B)
        set -l end (commandline -E)
        commandline -C $end
        $cmd_paste

        if test "$argv[2]" = --clip
            commandline -C (math $end - 1)
        else
            for i in (seq 0 (string length "$fish_killring[1]"))
                commandline -f backward-char
            end
        end
        commandline -f begin-selection
        for i in (seq $start (math $end - 2))
            commandline -f backward-char
        end
        if test $cursor != $start
            commandline -f swap-selection-start-stop
        end
    end

    function __fish_helix_replace_selection -a replacement cmd_paste
        set -l cmd_paste $(string split " " $cmd_paste)
        set cursor (commandline -C)
        set start (commandline -B)
        set end (commandline -E)
        commandline |
            sed -zE 's/^(.{'$start'})(.{0,'(math $end - $start)'})(.*)\\n$/\\1'"$(string escape --style=regex "$replacement")"'\\3/' |
            read -l result

        commandline "$result"
        commandline -C $start
        $cmd_paste

        if test "$argv[3]" = --clip
            commandline -f backward-char begin-selection
            for i in (seq (math $start + 2) (commandline -C))
                commandline -f backward-char
            end
            if test $cursor != $start
                commandline -f swap-selection-start-stop
            end
        else
            commandline -f begin-selection
            for i in (seq 2 (string length "$replacement"))
                commandline -f forward-char
            end
            if test $cursor = $start
                commandline -f swap-selection-start-stop
            end
        end
    end

    function fish_bind_count
        argparse h/help z/zero r/read -- $argv
        or return 1
        if test -n "$_flag_help"
            echo "Helper function to track count modifier with modal key bindings"
            echo "Usage: $0 [-h] [-z] [DIGITS ...]"
            return
        end
        if test -n "$_flag_zero" || not string match -rq '[1-9]\d*' "$fish_bind_count"
            set -g fish_bind_count 0
        end
        # Iterate over given digits
        for arg in $argv
            for digit in (string split '' "$arg")
                set -g fish_bind_count $(math "$fish_bind_count" \* 10 \+ "$digit")
            end
        end
        if test -n "$_flag_read"
            set -l count "$fish_bind_count"
            set -g fish_bind_count 0
            if test "$count" = 0
                echo 1
                return 1
            else
                echo "$count"
            end
        end
    end
end
