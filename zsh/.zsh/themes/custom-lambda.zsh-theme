local lambda="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})λ%{$reset_color%}"
local curr_dir="%{$fg[cyan]%}%c%{$reset_color%}"
PROMPT='${curr_dir} $(git_prompt_info)${lambda} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
