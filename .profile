for file in ~/.{path,exports,aliases,extra}; do
    [ -r "$file" ] && source "$file"
done
unset file

if [[ -z `git config user.name` ]]; then
    echo -n "Please, enter user name for git config [Name Surname (nickname)]: "
    read GIT_AUTHOR_NAME
    mkdir -p ~/.config/git/
    git config -f ~/.config/git/config user.name "$GIT_AUTHOR_NAME"
fi

if [[ -z `git config user.email` ]]; then
    echo -n "Please, enter email for git config: "
    read GIT_AUTHOR_EMAIL
    mkdir -p ~/.config/git/
    git config -f ~/.config/git/config user.email "$GIT_AUTHOR_EMAIL"
fi

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
