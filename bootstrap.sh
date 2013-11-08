#!/usr/bin/env bash
cd "$(dirname "$0")"
git pull
for f in `find . -name '\.*' -exec basename {} \; | grep -v '\(git\|\.\)$'`
do
    ln -fs $PWD/$f ~/$f
done
ln -fs $PWD/bin ~/bin
source ~/.profile
