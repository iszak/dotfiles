export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"

plugins=(git jira brew autojump mosh sublime atom cp)

source "$ZSH/oh-my-zsh.sh"

source .aliases
source .exports
