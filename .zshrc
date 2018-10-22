# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/a-kostyuk/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

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
DISABLE_AUTO_TITLE="true"

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
plugins=(git docker docker-compose virtualenvwrapper)

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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set up default shell user
DEFAULT_USER=a-kostyuk

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

prompt_context() {
    if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
        prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
    fi
}

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

# Too much aliases
alias sally=' alias | ag'

# Git extensions
alias grom='git remote update && git rebase origin/master'

# Multihead setups
alias multihead-left='xrandr --output eDP-1 --auto --output DP-1 --auto --primary --left-of eDP-1'
alias multihead-right='xrandr --output eDP-1 --auto --output DP-1 --auto --primary --right-of eDP-1'

alias drm='docker run --rm -it'
alias dcrm='docker-compose run --rm'
alias rdev='ranger ~/develop'

# Camptocamp specific CLI tools

alias dcnuke='docker-compose down -v'

# XXX: under demolishment, dodoo ftw
# TODO: drop, move to ~/bin/clit
alias rebuild-nosync='git checkout master && git pull --rebase && git submodule update --init && docker-compose build --no-cache && dodoo run -p 1337 --stop-after-init && git checkout - && notify-send -t 0 -i ~/Pictures/master-race.jpg '\''hey m8 your build is finished'\'' $(pwd)'

alias yuno='watch flake8 . --exclude=__init__.py'
alias gsss='git submodule sync && git submodule update --init'

# save for blacker days
# alias yolo="git add . && git commit -m 'DEAL WITH IT' && git push -f origin/master"

export WORKON_HOME='/home/a-kostyuk/.virtualenvs'
export VIRTUAL_ENV_DISABLE_PROMPT='True'

# update Spacemacs in one keystroke
# alias spacemacs-update="git -C ~/.emacs.d/ remote update && git -C ~/.emacs.d/ log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset origin/develop@{1}..origin/develop' && git -C ~/.emacs.d/ rebase origin/develop"
alias spacemacs-update="git -C ~/.emacs.d/ pull --rebase origin && git -C ~/.emacs.d/ log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' origin/develop@{1}..origin/develop"

export SPACESHIP_DOCKER_SHOW=false

# Invoke tab-completion script to be sourced with the Z shell.
# Known to work on zsh 5.0.x, probably works on later 4.x releases as well (as
# it uses the older compctl completion system).

_complete_invoke() {
    # `words` contains the entire command string up til now (including
    # program name).
    #
    # We hand it to Invoke so it can figure out the current context: spit back
    # core options, task names, the current task's options, or some combo.
    #
    # Before doing so, we attempt to tease out any collection flag+arg so we
    # can ensure it is applied correctly.
    collection_arg=''
    if [[ "${words}" =~ "(-c|--collection) [^ ]+" ]]; then
        collection_arg=$MATCH
    fi
    # `reply` is the array of valid completions handed back to `compctl`.
    # Use ${=...} to force whitespace splitting in expansion of
    # $collection_arg
    reply=( $(invoke ${=collection_arg} --complete -- ${words}) )
}


# Tell shell builtin to use the above for completing our given binary name(s).
# * -K: use given function name to generate completions.
# * +: specifies 'alternative' completion, where options after the '+' are only
#   used if the completion from the options before the '+' result in no matches.
# * -f: when function generates no results, use filenames.
# * positional args: program names to complete for.
compctl -K _complete_invoke + -f invoke inv

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
