# Zeus's Dotfiles

In this here repo live all my dotfiles

## Prerequisites

For the complete installation you will need the following programs installed:
For a every machine:
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

For a non-vm machine (these are only for a complete desktop experience):
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
