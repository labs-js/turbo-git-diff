#!/usr/bin/sh
# I took part of this script from here:
# https://github.com/zdharma/zsh-diff-so-fancy/blob/master/bin/git-dsf

os_name=""

if [[ $(uname -s) == Darw* ]]; then
    os_name="osx"
elif [[ "$(expr substr $(uname -s) 1 10)" == MINGW* ]]; then
    os_name="windows"
    git diff --color "$@"
    exit 0;
fi

path="$(dirname $0)/../../node_modules/diff-so-fancy/diff-so-fancy"

if [ ! -f $path ]; then
    path="$(dirname $0)/../node_modules/diff-so-fancy/diff-so-fancy"
else
    echo "turbo-git-diff error: diff-so-fancy path not found"
fi

f() {
    [ -z "$GIT_PREFIX" ] || \
        cd "$GIT_PREFIX" && \
        git diff --color "$@" | $path | less --tabs=4 -iRFX
    }

f "$@"usr
