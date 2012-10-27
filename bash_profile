export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=''
export PS1="\[$(tput bold)\]\[$(tput setaf 7)\][\u@\h\[$(tput setaf 7)\]:\[$(tput setaf 6)\]\w\[$(tput setaf 7)\]]$ \[$(tput sgr0)\]"
export SVNURL=https://sourcecontrol.ae.sda.corp.telstra.com
export EDITOR='/usr/bin/vim'

alias 'vi=vim'
declare -x GEM_PATH=~/.gems
declare -x GEM_HOME=~/.gems
declare -x PATH=$PATH:~/.gems/bin:~/.rbenv/shims:~/sbin/:~/Projects/tecs-software-suite-2.5/
set -o vi

function gemexec() { ruby -I lib/ $1 $2; }

keychain id_rsa
[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
[ -f $HOME/.keychain/$HOSTNAME-sh ] && \
        . $HOME/.keychain/$HOSTNAME-sh
[ -f $HOME/.keychain/$HOSTNAME-sh-gpg ] && \
        . $HOME/.keychain/$HOSTNAME-sh-gpg
