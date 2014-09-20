#!/usr/bin/env bash
cd "$(dirname "$0")"
git pull
for f in `find . -name '\.*' -exec basename {} \; | grep -v 'git\|\.$\|bash\|exports\|prompt'`
do
    ln -fs $PWD/$f ~
done
cp .gitconfig ~/.gitconfig
source ~/.profile
