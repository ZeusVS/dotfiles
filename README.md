# Zeus's Dotfiles

In this here repo live all my dotfiles, it's a mess atm

## Prerequisites

For the complete installation you will need the following programs installed:

* curl
* nvim
    * TODO: Check if we maybe need to add more lsp/formatters to 'must install'
* neofetch

* zsh
    * zsh-syntax-highlighting
    * powerlevel10k
    * fzf
        ```bash
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
        ```
    * zsh-vi-mode.plugin
    * asdf
        * TODO: Check if we maybe need to add asdf config to dotfiles
        * asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
        * asdf install golang latest

* Install cargo
    * Install binstall from binary
    * Binstall lsd
    * Binstall rg
    * Binstall bat

For a complete desktop experience on a non vm/vps you will need some extra programs installed:

* alacritty
* eww
* i3
* picom
* rofi
* vivaldi

## Installation

In the root of the project run the following command:

```bash
./install.sh
```
