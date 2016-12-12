# --------------------------------------------------------------------------------
# ZSH Options
# --------------------------------------------------------------------------------
HISTFILE=~/.histfile                     # Where to save history
HISTSIZE=1000                            # Length of history to keep in buffer
SAVEHIST=1000                            # Length of history to save
setopt appendhistory                     # Share history between sessions
setopt autocd                            # Enter directory name to cd to that directory
setopt prompt_subst                      # Re-evaluate, expand prompt on each command
bindkey -v                               # Use VI key bindings

# --------------------------------------------------------------------------------
# Auto-completion settings
# --------------------------------------------------------------------------------

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/pmyjavec/.zshrc'
autoload -Uz compinit
compinit

# --------------------------------------------------------------------------------
# Alias and Bindings
# --------------------------------------------------------------------------------

bindkey '^k' history-substring-search-up    # vim style search
bindkey '^j' history-substring-search-down  # vim style searching

alias ls="ls -la --color"
alias erl="rlwrap erl -oldshell"
alias hi='history | tail -20'
alias vi=nvim
alias vim=nvim

# --------------------------------------------------------------------------------
# Color, prompt, themes
# --------------------------------------------------------------------------------

autoload colors && colors

# Base16 Shell
BASE16_SHELL="$HOME/.base16-shell/scripts/base16-harmonic16-light.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

PROMPT="%~%{$fg[green]%} → %{$reset_color%}"

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

test -x `which ssh-agent` && eval $(ssh-agent -s > /dev/null) # Start SSH Agent

# base16 colors
BASE16_SHELL=$HOME/.config/base16-shell/
test -d $BASE16_SHELL || git clone https://github.com/chriskempson/base16-shell.git $BASE16_SHELL
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_harmonic16-light

#eval "$(rbenv init -)" # rbenv

# Golang environment setup
export GOPATH="$HOME/projects/go"
export PATH=.bin:$PATH:$GOPATH/bin

export EDITOR='nvim'         # Set NeoVim as my default editor
export PAGER="less -FirSwX"  # Use less as the default pager
export MANPAGER="$PAGER"     # Use default pager for reading man pages
