#!/usr/bin/env zsh

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"

plugins=(git)

source "$ZSH/oh-my-zsh.sh"

source "$HOME/.rc"

if [ -f "$(which rbenv)" ]; then
    eval "$(rbenv init -)"
fi
