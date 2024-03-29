export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

# Fix bug concerning beginning '%'.
unset PROMPT_SP

# Fix bugs concerning clearing the prompt when LANG is not utf-8.
LANG=en_US.utf8
LC_CTYPE=en_US.utf8
LC_NUMERIC=en_US.utf8
LC_TIME=en_US.utf8
LC_COLLATE=en_US.utf8
LC_MONETARY=en_US.utf8
LC_MESSAGES=en_US.utf8
LC_PAPER=en_US.utf8
LC_NAME=en_US.utf8
LC_ADDRESS=en_US.utf8
LC_TELEPHONE=en_US.utf8
LC_MEASUREMENT=en_US.utf8
LC_IDENTIFICATION=en_US.utf8

source "$ZSH/oh-my-zsh.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f /etc/bash_completion.d/g4d ] && source /etc/bash_completion.d/g4d
[ -f /etc/bash_completion.d/hgd ] && source /etc/bash_completion.d/hgd
