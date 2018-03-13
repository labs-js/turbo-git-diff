#!/bin/sh
# I took part of this script from here:
# https://github.com/zdharma/zsh-diff-so-fancy/blob/master/bin/git-dsf

path="$(dirname $0)/../node_modules/diff-so-fancy/diff-so-fancy"

f() {
    [ -z "$GIT_PREFIX" ] || \
        cd "$GIT_PREFIX" && \
        git diff --color "$@" | $path | less --tabs=4 -iRFX
    }

f "$@"
