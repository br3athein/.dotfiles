setfont /usr/share/kbd/consolefonts/Lat2-Terminus16.psfu.gz

export TERM=rxvt-unicode-256color

PATH=$HOME/.local/bin:$PATH
PATH=$HOME/go/bin:$PATH
PATH=$HOME/.cargo/bin:$PATH
PATH=$HOME/develop/c2c/clitools:$PATH
PATH=$HOME/.config/composer/vendor/bin:$PATH
PATH=$HOME/.dotfiles/scripts:$PATH
export PATH

export WORKON_HOME=$HOME/Stuff/virtualenvs
export GOPATH=$HOME/go
source /usr/bin/virtualenvwrapper.sh

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
