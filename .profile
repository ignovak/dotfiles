# $FreeBSD$
#
# .profile - Bourne Shell startup script for login shells
#
# see also sh(1), environ(7).
#

# remove /usr/games if you want

# Setting TERM is normally done through /etc/ttys.  Do only override
# if you're sure that you'll never log in via telnet or xterm or a
# serial line.
# Use cons25l1 for iso-* fonts
# TERM=cons25; 	export TERM

BLOCKSIZE=K;	export BLOCKSIZE
EDITOR=vi;   	export EDITOR
PAGER=more;  	export PAGER

HISTSIZE=5000; 	export HISTSIZE

# set ENV to a file invoked each time sh is started for interactive use.
ENV=$HOME/.shrc; export ENV

if [ -x /usr/games/fortune ] ; then /usr/games/fortune freebsd-tips ; fi

export PATH=$HOME/node_modules/.bin:$HOME/bin:$PATH:/sbin:/bin:/usr/sbin:/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin:/Berkanavt/bin:/Berkanavt/bin/scripts:$HOME/bin
export EDITOR=vim

# http://habrahabr.ru/post/153871/
export PAGER=less
export LESS_TERMCAP_mb=$'\E[33m'
export LESS_TERMCAP_md=$'\E[31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[42;30m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[32m'
export LESS_TERMCAP_ue=$'\E[0m'
alias la='ls -aG'
alias ll='ls -laG'
alias grep='grep --color=auto'

alias ssvn='screen -dR svn'
alias smake='screen -dR gmake'
alias slog='screen -dR log'
alias sall='screen -dR all'

export LANG=ru_RU.UTF-8
# export PS1="`whoami`@`hostname | sed 's/\..*//'`:\w > "
SCREEN_SESSION_NAME=`echo ${STY} | sed 's/[0-9]*\.//'`
if [[ $SCREEN_SESSION_NAME == '' ]]
    then export PS1="\w $ "
else
    export PS1="[$SCREEN_SESSION_NAME] \w $ "
fi

if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi
_expand()
{
    return 0;
}

# обновление шаблонов images2
IMAGES2ROOT=/hol/arkanavt/report/templates/YxWeb/images2; export IMAGES2ROOT
alias images2update='sudo chown -R $USER:www $IMAGES2ROOT && svn up $IMAGES2ROOT/* && gmake -B -C $IMAGES2ROOT'

alias diff=colordiff

alias sst='svn status'
alias sup='svn update'
alias sci='svn commit -m'

sdi()
{
    svn diff $@ | colordiff
}

alias gst='git status'
alias gbr='git branch'

alias zelo-update='ssh -i ~/.ssh/zelo-update kaa@zelo'
alias zelo-restart='ssh -i ~/.ssh/zelo-restart kaa@zelo'

# просмотр логов рабочей копии
wclog()
{
    if [ -z "$1" -o ! -d "/home/$USER/$1/" ]; then
        tail -f "/var/tmp/$USER-d-trunk.log"
    else
        tail -f "/var/tmp/$USER-d-${1}.log"
    fi
}

# # command prompt
# case $TERM in
#     screen*)
#         SCREENTITLE='\[\ek\e\\\]\[\ek\W\e\\\]'
#         ;;
#     *)
#         SCREENTITLE=''
#         ;;
# esac
# export PS1="${SCREENTITLE}[\u@\h \W]\$ "

# alias cssmake='touch pages-desktop/search/search.deps.js && gmake -j pages-desktop/search/_*.css && rm pages-desktop/search/all/_all.priv.js && gmake -j pages-desktop/search/all/_all.priv.js'
# alias bemhtmlmake='touch pages-desktop/search/search.deps.js && gmake -j pages-desktop/search/all/_all.bemhtml.js'
# alias privmake='rm pages-desktop/search/all/_all.priv.js && gmake -j pages-desktop/search/all/_all.priv.js'

cd wc1/web
