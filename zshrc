#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

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

# Proxy when at the Enterpri$e
if [[ `networksetup -getcurrentlocation` == 'Work' || `networksetup -getcurrentlocation` == 'Work Remote' ]]; then
    LOCAL_PROXY="http://localhost:3128"
    export {all_proxy,http_proxy,https_proxy}=$LOCAL_PROXY
fi
alias unset_proxy="unset {all_proxy,http_proxy,https_proxy}"

# VIMMMMMM
export EDITOR='/usr/local/bin/vim'
export VISUAL='/usr/local/bin/vim'

# Ansible Options
export ANSIBLE_SSH_CONTROL_PATH='/tmp/'

# Path
export GOPATH="$HOME/projects/go"
export PATH=.bin:$PATH:$GOPATH/bin

$(boot2docker shellinit)


# bind k and j for VI mode
bindkey '^k' history-substring-search-up
bindkey '^j' history-substring-search-down

