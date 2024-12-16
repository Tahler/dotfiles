# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
