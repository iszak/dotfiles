export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"

plugins=(git jira brew autojump mosh sublime atom cp)

source "$ZSH/oh-my-zsh.sh"


# Path
if [[ -d /opt/boxen ]]; then
    export PATH="/opt/boxen/bin:$PATH"
fi

if [[ -d /opt/boxen/homebrew ]]; then
    export PATH="/opt/boxen/homebrew/bin:$PATH"
    export PATH="/opt/boxen/homebrew/sbin:$PATH"
fi

export PATH="bin:$PATH"


# Language
export LANG="en_GB.UTF-8"


# Editor
export EDITOR='vim'


# SSH Keys
export SSH_KEY_PATH="$HOME/.ssh/dsa_id"


# Boxen
if [[ -f /opt/boxen/env.sh ]]; then
    /opt/boxen/env.sh
fi


# Go
export PATH=$PATH:/usr/local/go/bin
export GOPATH=~/.go/


# Packer
if [[ -f /opt/boxen/packer ]]; then
    export PATH="/opt/boxen/packer:$PATH"
fi
