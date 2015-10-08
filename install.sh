#!/usr/bin/env bash

cd "$(dirname "$0")"
git pull
for f in `find . -name '\.*' -exec basename {} \; | grep -v 'git\|\.$\|bash\|exports\|prompt'`
do
    if [ -f ~/$f ]; then
        mv ~/$f ~/$f.bk
        echo Save ~/$f.bk
    fi
    ln -fs $PWD/$f ~
done

mkdir -p ~/.config/git/
touch ~/.config/git/config
git config -f ~/.config/git/config user.name `git config user.name`
git config -f ~/.config/git/config user.email `git config user.email`
if [ -f ~/.gitconfig ]; then
    mv ~/.gitconfig ~/.gitconfig.bk
    echo Warning: ~/.gitconfig is backed up with ~/.gitconfig.bk and replaced with a symlink to ~/$PWD/.gitconfig
    echo Use diff ~/.gitconfig.bk ~/.gitconfig in order to see check changes
    echo Use ~/.config/git/config for personal git settings, i.e. name or email
fi
ln -s ~/$PWD/.gitconfig ~/.gitconfig

source ~/.profile

echo Fetch/update neobundle.vim
rm -rf ~/.vim/bundle/neobundle.vim
curl https://codeload.github.com/Shougo/neobundle.vim/tar.gz/master > neobundle.tar.gz
mkdir -p .vim/bundle/
tar xf neobundle.tar.gz
mv neobundle.vim-master .vim/bundle/neobundle.vim
rm neobundle.tar.gz
echo Done
