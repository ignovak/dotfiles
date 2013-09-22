for file in ~/.{path,exports,aliases,extra}; do
    [ -r "$file" ] && source "$file"
done
unset file

alias ll='ls -laFo'
alias l='ls -l'
alias la='ls -la'
alias ltr='ls -ltr'

alias e=$EDITOR
alias tm="tmux -2 -S /tmp/tm-$USER"

# Save ssh agent socket for using in tmux sessions
if [[ $SSH_AUTH_SOCK && $SSH_AUTH_SOCK != $HOME/.ssh/ssh_auth_sock ]]
then
    ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
fi

_expand()
{
    return 0;
}
