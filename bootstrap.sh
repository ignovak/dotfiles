#!/usr/bin/env bash
cd "$(dirname "$0")"
git pull
for f in `find . -type f -name '\.*' -d 1 | xargs basename | grep -v profile`;
do
    ln -f $f ~/$f
done
cp .profile ~/.profile
source ~/.profile
