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

export PATH=$PATH:$HOME/bin
export XPATH=$PATH:$HOME/bin

#`walkabout get`
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
