# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
source ~/.privates

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
bindkey -M vicmd '?' history-incremental-search-backward

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

# Vim
export EDITOR=/usr/local/bin/vim
export EDITOR=/usr/local/bin/vim

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git gem svn yum)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
bindkey -v
bindkey '^R' history-incremental-search-backward

export PATH=/usr/local/bin:$PATH::$HOME/bin:/Applications/VMware\ OVF\ Tool/
#export XPATH=/usr/local/bin:$PATH:$HOME/bin

#`walkabout get`
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH=.bin:~/.bin:$PATH:/usr/local/share/python

# Makes rake arguments work with zsh
alias rake='noglob rake'

# Setup a proxy easily if onsite
LOCAL_PROXY="http://hydrogen.local:3128"
alias set_proxy="export {all_proxy,http_proxy,https_proxy}=$LOCAL_PROXY"
alias unset_proxy="unset {all_proxy,http_proxy,https_proxy}"

# Python virtualenv  + virtualenvwrapper stuff
export WORKON_HOME=$HOME/.python-envs
source /usr/local/share/python/virtualenvwrapper_lazy.sh
export PROJECT_HOME=$HOME/work
alias bundle='nocorrect bundle'

alias vi='vim'
alias grep='grep --color=always'

source `brew --prefix`/etc/profile.d/z.sh

compctl -g '~/.teamocil/*(:t:r)' teamocil

#GO
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# Vagrant
export VAGRANT_DEFAULT_PROVIDER="vmware_fusion"
export PATH="$PATH:/Applications/VMware Fusion.app/Contents/Library/"

# boot2docker
export DOCKER_HOST=tcp://localhost:4243

