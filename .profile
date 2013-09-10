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

source ~/dotfiles/git-completion.bash

if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

# Create a new directory and enter it
function d() {
    mkdir -p "$@" && cd "$@"
}

# Determine size of a file or total size of a directory
function fs() {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh
    else
        local arg=-sh
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@"
    else
        du $arg .[^.]* *
    fi
}

_expand()
{
    return 0;
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# Tmux session alias for pair-programming
# Syntax:
#    Server:
#        tm-pair <feature>
#    Client:
#        tm-pair <user> <feature>
function tm-pair
{
    if [ ${2} ]; then
        tmux -2 -S /tmp/tm-${1} attach -t ${2}
    else
        tmux -2 -S /tmp/tm-`whoami` new -s ${1}
    fi
}
