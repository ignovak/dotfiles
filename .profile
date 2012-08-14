export PATH=~/bin:$PATH
export PATH=~/node_modules/.bin:$PATH

export EDITOR=vim
export PAGER=more

alias ll='ls -laFo'
alias l='ls -l'
alias la='ls -la'
alias ltr='ls -ltr'

alias e=$EDITOR

export LANG=ru_RU.UTF-8

export PS1="`whoami`@`hostname | sed 's/\..*//'`:\w > "

_expand()
{
    return 0;
}
