local indicator="λ"
local indicator_colored="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})${indicator}%{$reset_color%}"

local curr_dir="%c"
local curr_dir_colored="%{$fg[cyan]%}${curr_dir}%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

PROMPT='${curr_dir_colored} $(git_prompt_info)${indicator_colored} '
