# FreeBSD stuff
#
# Setting TERM is normally done through /etc/ttys.  Do only override
# if you're sure that you'll never log in via telnet or xterm or a
# serial line.
# Use cons25l1 for iso-* fonts
# TERM=cons25;  export TERM

# set ENV to a file invoked each time sh is started for interactive use.
export ENV=$HOME/.shrc
export BLOCKSIZE=K

if [ -x /usr/games/fortune ] ; then /usr/games/fortune freebsd-tips ; fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && source "$file"
done
unset file

export LANG=ru_RU.UTF-8

# export PS1="`whoami`@`hostname | sed 's/\..*//'`:\w > "
HOST=`hostname | sed 's/\([a-z0-9]*\).*/\1/'`
SCREEN_SESSION_NAME=`echo ${STY} | sed 's/[0-9]*\.//'`
if [[ $SCREEN_SESSION_NAME == '' ]]
then export PS1="$HOST:\w $ "
else
    export PS1="$HOST[$SCREEN_SESSION_NAME]: \w $ "
fi
unset HOST

if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

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


[[ -d "wc1" ]] && cd wc1/web
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
