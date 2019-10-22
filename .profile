for file in ~/dotfiles/.{path,prompt,exports,extra}; do
    [ -r "$file" ] && source "$file"
done
unset file

[ "$BASH" ] && [ ! "$IS_BASHRC_LOADED" ] && source ~/dotfiles/.bashrc

if [ ! "$(git config user.name)" ]; then
    echo -n "Please, enter user name for git config [Name Surname (nickname)]: "
    read GIT_AUTHOR_NAME
    mkdir -p ~/.config/git/
    git config -f ~/.config/git/config user.name "$GIT_AUTHOR_NAME"
fi

if [ ! "$(git config user.email)" ]; then
    echo -n "Please, enter email for git config: "
    read GIT_AUTHOR_EMAIL
    mkdir -p ~/.config/git/
    git config -f ~/.config/git/config user.email "$GIT_AUTHOR_EMAIL"
fi

# alias e=$EDITOR
alias e=vim
alias tm="tmux -2 -S /tmp/tm-$USER"

# _expand()
# {
#     return 0;
# }

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*



alias bba='brazil-build apollo-pkg'
alias bre='brazil-runtime-exec'
alias brc='brazil-recursive-cmd'
alias bws='brazil ws'
alias bwsuse='bws use --gitMode -p'
alias bwscreate='bws create -n'
alias bbr='brc brazil-build'
alias bball='brc --allPackages'
alias bbb='brc --allPackages brazil-build'
alias bbra='bbr apollo-pkg'
# export JAVA_HOME=/apollo/env/JavaSE8/jdk1.8/bin
# export PATH=$JAVA_HOME:$PATH
alias sshn='ssh-nirvana'
alias r='post-review'
alias bb='brazil-build'
alias bbcb='brazil-build clean && brazil-build'
alias bbcbr='brazil-build clean && brazil-build release'
alias bbcbs='brazil-build clean && brazil-build server'
alias bbr='brazil-build release'
alias bbs='brazil-build server'
alias bbt='brazil-build test'
alias sync='brazil ws --sync --md'
alias kcurl='curl -k --location-trusted --negotiate -u: -b /tmp/cookies.txt -c /tmp/cookies.txt'
