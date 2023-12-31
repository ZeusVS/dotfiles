source "$XDG_CONFIG_HOME/zsh/aliases"

setopt AUTO_PARAM_SLASH
setopt globdots

source ~/dotfiles/zsh/external/completion.zsh

# Fuzzyfinder
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

fpath=($ZDOTDIR/external $fpath)

autoload -Uz prompt_purification_setup; prompt_purification_setup

# Enable Vi Mode
bindkey -v
export KEYTIMEOUT=1

# Enable cursor change according to insert or normal mode
autoload -Uz cursor_mode && cursor_mode

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -U compinit; compinit

source ~/dotfiles/zsh/script.sh
source ~/dotfiles/zsh/external/bd.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autostart startx
if [ "$(tty)" = "/dev/tty1" ];
then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
else
    neofetch
fi

