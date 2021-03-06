# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
autoload -U promptinit; promptinit
prompt spaceship

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fzf git docker docker-compose archlinux virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Gotta use vim anyways.
export EDITOR='vim'
alias vi='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set up default shell user
DEFAULT_USER=br3athein

# Customize `spaceship` theme
SPACESHIP_DIR_PREFIX=''
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false

# Ranger prompt (to say, I love this API <3)
SPACESHIP_RANGER_SHOW="${SPACESHIP_RANGER_SHOW=true}"
SPACESHIP_RANGER_PREFIX="${SPACESHIP_RANGER_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_RANGER_SUFFIX="${SPACESHIP_RANGER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_RANGER_SYMBOL="${SPACESHIP_RANGER_SYMBOL="¬ "}"
SPACESHIP_RANGER_COLOR="${SPACESHIP_RANGER_COLOR="blue"}"

spaceship_ranger() {
    [[ $SPACESHIP_RANGER_SHOW == false ]] && return
    spaceship::exists ranger || return
    [[ -n "$RANGER_LEVEL" ]] || return
    local 'ranger_status'
    ranger_status="rng$RANGER_LEVEL"

    spaceship::section \
        "$SPACESHIP_RANGER_COLOR" \
        "$SPACESHIP_RANGER_PREFIX" \
        "$SPACESHIP_RANGER_SYMBOL$ranger_status" \
        "$SPACESHIP_RANGER_SUFFIX"
}

SPACESHIP_PROMPT_ORDER=( "ranger" "${SPACESHIP_PROMPT_ORDER[@]}" )

# Force Ranger to remember the last visited dir
ranger-cd() {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
        if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
            cd -- "$(cat "$tempfile")"
        fi
    rm -f -- "$tempfile"
}
alias ranger='ranger-cd'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Handy!
alias zshconfig="$EDITOR ~/.zshrc"
alias reload='exec zsh'
alias py2='ipython2'
alias py3='ipython3'

alias pp=' ping -c 4 archlinux.org'
alias wp=' watch network-state'
alias pdiag=' journalctl -xefu netctl-auto@wlp3s0.service'

# Read stuff like a gangster
alias jxe='journalctl -xe'
alias jxeu='journalctl -xefu'
alias dmesg='dmesg --human'

# Run temporary Docker containers in-place
alias drub='docker run --rm -it ubuntu:16.04'
alias drce='docker run --rm -it centos:centos7'
alias dral='docker run --rm -it base/archlinux:latest'

# Docker: resolve IP
alias drip='docker inspect --format='\''{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'\'

# Docker && Docker-Compose
alias drm='docker run --rm -it'
alias dcrm='docker-compose run --rm'

# Multihead setups
alias multihead-left='xrandr --output eDP-1 --auto --output DP-1 --auto --primary --left-of eDP-1'
alias multihead-right='xrandr --output eDP-1 --auto --output DP-1 --auto --primary --right-of eDP-1'
# Finally, search through aliases
alias sally=' alias | rg'

alias gsss='git submodule sync && git submodule update --init'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vterm@emacs does not seem to play well w/ RET key
# so we're gonna hack into fzf itself and rebind accept action
export FZF_DEFAULT_OPTS="--bind=ctrl-l:accept"

export UID GID
