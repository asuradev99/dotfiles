set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)
set brmagenta (set_color -o magenta)

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

function fish_prompt --description 'Write out the prompt'
    set -l last_status $status
    echo ''
    # User
    set_color $fish_color_user
    set_color -o brmagenta

    echo -n $USER
    set_color normal

    # echo -n '@'

    # Host $fish_color_host
    # echo -n (prompt_hostname)
    set_color normal

    echo -n ': '

    # PWD $fish_color_cwd
    set_color brblue
    echo -n (prompt_pwd)
    set_color normal

    # Git
    set_color normal

    printf '%s ' (__fish_git_prompt)

    echo 

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    echo -n '❯ '
    set_color normal
end
