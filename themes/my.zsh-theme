#use extended color pallete if available
if [[ $TERM = *256color* || $TERM = *rxvt* || $TERM = *terminator* ]]; then
    turquoise="%F{81}"
    orange="%F{166}"
    purple="%F{135}"
    hotpink="%F{161}"
    limegreen="%F{118}"
else
    turquoise="$fg[cyan]"
    orange="$fg[yellow]"
    purple="$fg[magenta]"
    hotpink="$fg[red]"
    limegreen="$fg[green]"
fi

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

#PROMPT='
#in %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%}
#$(virtualenv_info)$ '
PROMPT=$'
%{$purple%}%n%{$reset_color%} in %{$orange%}$(collapse_pwd)%{$reset_color%}$(git_prompt_info)
$ '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$turquoise%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
