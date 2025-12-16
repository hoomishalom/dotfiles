if status is-interactive
    # ---- Zoxide ----
    zoxide init fish | source

    # ---- Prompt ----
    function fish_prompt
        set -l last_status $status

        printf '[%s@%s %s' (whoami) (hostname) (basename $PWD)

        if test $last_status -ne 0
            set_color red
            printf ' [%d]' $last_status
            set_color normal
        end

        printf ']: '
    end

    # ---- Aliases ----
    alias ls="eza"
    alias lsa="eza -lSa"
    alias lsh="eza -a"
    alias nvd="neovide"
end
