#!/bin/sh
# I took part of this script from here:
# https://github.com/zdharma/zsh-diff-so-fancy/blob/master/bin/git-dsf
#
# POSIX sh (invoked via `sh` from lib/diff.js): on windows (git bash / msys)
# plain git diff is used; elsewhere the output is piped through
# diff-so-fancy when it can be located, falling back to plain git diff.

case "$(uname -s)" in
    MINGW*|MSYS*|CYGWIN*)
        git diff --color "$@"
        exit 0
        ;;
esac

# Candidate locations for the diff-so-fancy executable, in order:
# 1. hoisted consumer install:  <root>/node_modules/diff-so-fancy
#    (lib/diff.sh sits at <root>/node_modules/turbo-git-diff/lib)
# 2. nested install or local clone: <pkg>/node_modules/diff-so-fancy
path="$(dirname "$0")/../../diff-so-fancy/diff-so-fancy"

if [ ! -f "$path" ]; then
    path="$(dirname "$0")/../node_modules/diff-so-fancy/diff-so-fancy"
fi

if [ ! -f "$path" ]; then
    echo "turbo-git-diff: diff-so-fancy not found, using plain git diff" >&2
    git diff --color "$@"
    exit 0
fi

f() {
    [ -z "$GIT_PREFIX" ] || \
        cd "$GIT_PREFIX" && \
        git diff --color "$@" | "$path" | less --tabs=4 -iRFX
}

f "$@"
