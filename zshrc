# --------------------------------------------------------------------------------
# ZSH Options
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
# Auto-completion settings
# --------------------------------------------------------------------------------

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/pmyjavec/.zshrc'
autoload -Uz compinit
compinit

# This works for NixOS
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  #TODO: Nixos, add completions.
fi

# This does the same as above but works on Arch and probably other *nix
if [ -f /usr/share/fzf/key-bindings.zsh ]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

# --------------------------------------------------------------------------------
# Alias and Bindings
# --------------------------------------------------------------------------------

# Allow editing of current command
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
bindkey '^k' history-beginning-search-backward
bindkey '^j' history-beginning-search-forward # vim style searching


alias ls="ls --color -l"
alias hi='history | tail -20'
alias vi=nvim
alias vim=nvim
alias sc="sudo systemctl"
alias v=nvim
alias g=git
alias gr=grep

# --------------------------------------------------------------------------------
# Color, prompt, themes
# --------------------------------------------------------------------------------

autoload colors && colors

# Base16 Shell
BASE16_SHELL="$HOME/.base16-shell/scripts/base16-monokai.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

PROMPT="%{$fg[blue]%}%~%{$fg[green]%} → %{$reset_color%}"

# Right handprompt settings
autoload -Uz vcs_info #
zstyle ':vcs_info:*' enable git             # Gather information about git repos
zstyle ':vcs_info:*' check-for-changes true # Check for changes after each command
zstyle ':vcs_info:*' stagedstr '+'          # When changes are staged, show a +
zstyle ':vcs_info:*' unstagedstr '-'        # Display - when stages aren't staged
zstyle ':vcs_info:git*' formats "%{$fg[blue]%}%b %{$fg[grey]%}[%{$fg[red]%}%u%c%{$fg[grey]%}]%{$reset_color%}"

precmd() { # Gathers information before updating prompt
    vcs_info
}

RPROMPT='${vcs_info_msg_0_}' # Right hand prompt to show information from VCS

# --------------------------------------------------------------------------------
# Environment Setup
# --------------------------------------------------------------------------------

# Z easy directory nagivation
test -d "/usr/share/fzf" && source /usr/share/fzf/*.zsh

#test -x `which ssh-agent` && eval $(ssh-agent -s > /dev/null) # Start SSH Agent

# base16 colors
BASE16_SHELL=$HOME/.config/base16-shell/
test -d $BASE16_SHELL || git clone https://github.com/chriskempson/base16-shell.git $BASE16_SHELL
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_monokai

test -d $HOME/.zupa-z || git clone https://github.com/rupa/z/ $HOME/.zupa-z
. $HOME/.zupa-z/z.sh

eval "$(rbenv init -)" # rbenv

# Golang environment setup
export GOPATH="$HOME/projects/go"
export PATH=.bin:$PATH:$GOPATH/bin:bin

# https://github.com/junegunn/fzf#respecting-gitignore-hgignore-and-svnignore
export FZF_DEFAULT_COMMAND='ag -g ""'

export $(gnome-keyring-daemon -s)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
export PATH="$HOME/.rbenv/bin:$PATH"

alias xcopy='xclip -selection clipboard'
alias xpaste='xclip -selection clipboard -o'
alias grom="git pull -r origin master"
