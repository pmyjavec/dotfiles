# Vim bindings
set -o vi

# Customize to your needs...

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Z easy directory nagivation
. `brew --prefix`/etc/profile.d/z.sh

# rbenv
eval "$(rbenv init -)"

# SSH Agent
eval $(ssh-agent -s > /dev/null)

# Use latest VIM installed with Homebrew
export EDITOR='/usr/local/bin/vim'
export VISUAL='/usr/local/bin/vim'

# Path
export GOPATH="$HOME/projects/go"
export PATH=.bin:$PATH:$GOPATH/bin


# bind k and j for VI mode
bindkey '^k' history-substring-search-up
bindkey '^j' history-substring-search-down

eval `ssh-agent -s` > /dev/null

unsetopt correct

alias ls="ls -la"
alias erl="rlwrap erl -oldshell"
