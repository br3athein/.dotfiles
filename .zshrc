# Lines configured by zsh-newuser-install
HISTFILE=~/.zshist
HISTSIZE=1000
SAVEHIST=3000
setopt appendhistory autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/br3athein/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PROMPT='%B%F{green}%n@%m%f%b %(!.#.$) '
RPROMPT='[%F{yellow}%0d ?%?%f]'

# Transferred directly from .bashrc, cause I like them this way
alias ls='ls --color=auto'
alias ll='ls -laF'
alias la='ls -A'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
