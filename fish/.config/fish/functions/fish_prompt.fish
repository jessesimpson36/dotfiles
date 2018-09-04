function fish_prompt --description 'Write out the prompt'
	#Save the return status of the previous command
    set stat $status

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __fish_color_blue
        set -g __fish_color_blue (set_color -o blue)
    end

    #Set the color for the status depending on the value
    set __fish_color_status (set_color -o green)
    if test $stat -gt 0
        set __fish_color_status (set_color -o red)
    end

    switch "$USER"

        case root toor

            if not set -q __fish_prompt_cwd
                if set -q fish_color_cwd_root
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
                else
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd)
                end
            end

            printf '%s@%s %s%s%s# ' $USER (prompt_hostname) "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal"

        case '*'

            if not set -q __fish_prompt_cwd
                set -g __fish_prompt_cwd (set_color $fish_color_cwd)
            end

            printf '[%s]%s%s > ' (date "+%H:%M:%S") "$__fish_prompt_cwd" "$__fish_prompt_normal"


    end
end


function fish_right_prompt -d "Write out the right prompt"
    set -l exit_code $status
    set -l is_git_repository (git rev-parse --is-inside-work-tree ^/dev/null)

    set_color normal

    # Print the current directory. Replace $HOME with ~.
    echo -n (pwd | sed -e "s|^$HOME|~|")

    # Print the current git branch name or shortened commit hash in colour.
    #
    # Green means the working directory is clean.
    # Yellow means all changed files have been staged.
    # Red means there are changed files that are not yet staged.
    #
    # Untracked files are ignored.
    if test -n "$is_git_repository"
        echo -n ":"

        set -l branch (git symbolic-ref --short HEAD ^/dev/null; or git show-ref --head -s --abbrev | head -n1 ^/dev/null)

        git diff-files --quiet --ignore-submodules ^/dev/null; or set -l has_unstaged_files
        git diff-index --quiet --ignore-submodules --cached HEAD ^/dev/null; or set -l has_staged_files

        if set -q has_unstaged_files
            set_color red
        else if set -q has_staged_files
            set_color yellow
        else
            set_color green
        end
        echo -n $branch
        set_color green
    end
end
