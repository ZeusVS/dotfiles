# For config data
export XDG_CONFIG_HOME="$HOME/.config"

# For specific data
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"

# For cached files
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export EDITOR="nvim"
export VISUAL="nvim"

# For dotfiles
export DOTFILES="$HOME/dotfiles"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# History filepath
export HISTFILE="$ZDOTDIR/.zhistory"
# Maximum events for internal history
export HISTSIZE=10000
# Maximum events in history file
export SAVEHIST=10000

export FZF_DEFAULT_OPTS="--preview 'bat --color=always --line-range=:500 {}' --pointer='>'"
export FZF_ALT_C_OPTS="--preview 'lsd --tree --icon always --color always --depth 3 {}'"
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
. "$HOME/.cargo/env"
