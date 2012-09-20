export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=''
export PS1="\[\033[1;35m\][\u@\h:\[\033[0m\]\[\033[1;35m\]\w\[\033[0m\]\[\033[1;35m\]]$ \[\033[0m\]"
export SVNURL=https://sourcecontrol.ae.sda.corp.telstra.com
export EDITOR='/usr/bin/vim'

alias 'vi=vim'
declare -x GEM_PATH=~/.gems
declare -x GEM_HOME=~/.gems
declare -x PATH=$PATH:~/.gems/bin:~/.rbenv/shims:~/sbin/:~/Projects/tecs-software-suite-2.5/
set -o vi
