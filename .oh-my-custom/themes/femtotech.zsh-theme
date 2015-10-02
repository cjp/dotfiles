PROMPT='%F{10}%n@%F{11}%m %F{blue}%2c%(?,%{%F{green}%},%{%F{red}%}) ❯%f '
RPROMPT='$(git_prompt_info) %(?,%{%F{green}%},%{%F{red}%})❮ %F{blue}%D{%H:%M} %F{yellow}%D{%Z}%f'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}*%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""
