#!/usr/bin/env bash

cd "$(dirname "$0")"
git pull
for f in `find . -name '\.*' -exec basename {} \; | grep -v 'git\|\.$\|bash\|exports\|prompt'`
do
    ln -fs $PWD/$f ~
done

GIT_AUTHOR_NAME=`git config --global user.name`
GIT_AUTHOR_EMAIL=`git config --global user.email`
cp .gitconfig ~/.gitconfig
git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"

source ~/.profile

echo Fetch/update neobundle.vim
rm -rf ~/.vim/bundle/neobundle.vim
curl https://codeload.github.com/Shougo/neobundle.vim/tar.gz/master > neobundle.tar.gz
mkdir -p .vim/bundle/
tar xf neobundle.tar.gz
mv neobundle.vim-master .vim/bundle/neobundle.vim
rm neobundle.tar.gz
echo Done
