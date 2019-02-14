#!/usr/bin/env bash

create_link() {
  echo -e "Linking $1 -> $2"
  ln -sf $1 $2
}

# Create symlinks, overwriting current
echo -e "Creating directories and symlinks...\n"

#===========================================
#Neovim
#===========================================
mkdir -p $HOME/.config/nvim

dotVim="$PWD/vim"
sysVim="$HOME/.config/nvim"
create_link $dotVim $sysVim

dotVimrc="$PWD/vimrc"
sysVimrc="$HOME/.config/nvim/init.vim"
create_link $dotVimrc $sysVimrc

#===========================================
#Alacritty
#===========================================
mkdir -p $HOME/.config/alacritty

dotAlac="$PWD/alacritty.yml"
sysAlac="$HOME/.config/alacritty/alacritty.yml"
create_link $dotAlac $sysAlac

#===========================================
#Zsh
#===========================================
dotZsh="$PWD/zshrc"
sysZsh="$HOME/.config/nvim"
create_link $dotZsh $sysZsh

#===========================================
#Tmux
#===========================================
dotTmux="$PWD/tmux.conf"
sysTmux="$HOME/.tmux.conf"
create_link $dotTmux $sysTmux

echo "Dotfile install complete!"
