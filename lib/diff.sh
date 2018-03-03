#!/bin/sh
# I took this script from:
# https://github.com/zdharma/zsh-diff-so-fancy/blob/master/bin/git-dsf

f() {
    [ -z "$GIT_PREFIX" ] || \
        cd "$GIT_PREFIX" && \
        git diff --color "$@" | diff-so-fancy | less --tabs=4 -iRFX
    }

f "$@"
