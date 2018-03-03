#!/bin/sh
# I took this script from here:
# https://github.com/zdharma/zsh-diff-so-fancy/blob/master/bin/git-dsf

f() {
    [ -z "$GIT_PREFIX" ] || \
        cd "$GIT_PREFIX" && \
        git diff --color "$@" | ./node_modules/.bin/diff-so-fancy | less --tabs=4 -iRFX
    }

f "$@"
