#!/usr/bin/env bash
cd "$(dirname "$0")"
git pull
for f in `find . -type f -name '\.*' -exec basename {} \;`
do
    ln -fs $PWD/$f ~/$f
done
source ~/.profile
