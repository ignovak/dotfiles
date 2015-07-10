for file in ~/dotfiles/.{path,prompt,exports,extra}; do
    [ -r "$file" ] && source "$file"
done
unset file

[ "$BASH" ] && [ ! "$IS_BASHRC_LOADED" ] && source ~/dotfiles/.bashrc

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

alias e=$EDITOR
alias tm="tmux -2 -S /tmp/tm-$USER"

# _expand()
# {
#     return 0;
# }
