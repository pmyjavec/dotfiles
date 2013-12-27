# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
source ~/.privates

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

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

export PATH=/usr/local/bin:$PATH::$HOME/bin
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
alias work='cd ~/work'
alias vi='vim'

source `brew --prefix`/etc/profile.d/z.sh

compctl -g '~/.teamocil/*(:t:r)' teamocil
