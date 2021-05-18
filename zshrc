# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/pmyjavec/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spacehsip"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode history-substring-search python fzf tmux z)

export FZF_DEFAULT_COMMAND='ag -g ""'
#
source $ZSH/oh-my-zsh.sh

# --------------------------------------------------------------------------------
export EDITOR='nvim'        # Set NeoVim as my default editor
export PAGER="less -FirSwX" # Use less as the default pager
export MANPAGER="$PAGER"    # Use default pager for reading man pages
HISTFILE=~/.histfile        # Where to save history
HISTSIZE=5000               # Length of history to keep in buffer
SAVEHIST=10000              # Length of history to save
setopt share_history        # Share history between sessions
setopt autocd               # Enter directory name to cd to that directory
setopt prompt_subst         # Re-evaluate, expand prompt on each command
bindkey -v                  # Use VI key bindings

# --------------------------------------------------------------------------------
# Alias and Bindings
# --------------------------------------------------------------------------------

# Allow editing of current command
#autoload edit-command-line
#zle -N edit-command-line
#bindkey -M vicmd v edit-command-line
#bindkey '^k' history-beginning-search-backward
#bindkey '^j' history-beginning-search-forward # vim style searching

alias ls="ls --color -l"
alias hi='history | tail -20'
alias vi=nvim
alias vim=nvim
alias sc="sudo systemctl"
alias v=nvim
alias gr=grep
alias xcopy='xclip -selection clipboard'
alias xpaste='xclip -selection clipboard -o'
alias grom="git pull -r origin master"

# --------------------------------------------------------------------------------
# Environment Setup
# --------------------------------------------------------------------------------

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Golang environment setup
export GOPATH="$HOME/projects/go"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/bin

# https://github.com/junegunn/fzf#respecting-gitignore-hgignore-and-svnignore
export AWS_SDK_LOAD_CONFIG=true

# aws-vault Config
export AWS_VAULT_BACKEND=secret-service
#export AWS_VAULT_PROMPT=ykman
#export AWS_VAULT_PASS_CMD=gopass
#export AWS_VAULT_PASS_PREFIX=aws-vault

#export $(gnome-keyring-daemon -s)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(direnv hook zsh)"

for role in $( aws-vault list --profiles ); do
  eval "${role}() { export AWS_PROFILE=${role}; }"
done

. $HOME/.asdf/asdf.sh

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
