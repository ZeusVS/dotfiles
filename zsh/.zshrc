# Personal config for ZSH

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Autostart startx from tty1
if [ "$(tty)" = "/dev/tty1" ];
then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc" 
fi

# Load asdf
export ASDF_GOLANG_MOD_VERSION_ENABLED=true
. "$HOME/.asdf/asdf.sh"

# Load aliases and fpath
fpath=($fpath $ZDOTDIR/external)
fpath=($fpath ${ASDF_DIR}/completions)
source "$XDG_CONFIG_HOME/zsh/aliases"

# Add stuff to path
export PATH="$HOME/go/bin/:$PATH"
export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH="$HOME/.fzf/bin:$PATH"

# Setup stuff
source <(fzf --zsh)
eval "$(tmuxifier init -)"


setopt AUTO_PARAM_SLASH
setopt globdots

# Auto/tab complete
source $DOTFILES/zsh/external/completion.zsh
autoload -Uz compinit 
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/.p10k.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
