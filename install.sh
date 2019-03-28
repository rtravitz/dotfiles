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

#after
dot="$PWD/vim/after"
sys="$HOME/.config/nvim/after"
create_link $dot $sys

#ftdetect
dot="$PWD/vim/ftdetect"
sys="$HOME/.config/nvim/ftdetect"
create_link $dot $sys

#vimrc
dot="$PWD/vimrc"
sys="$HOME/.config/nvim/init.vim"
create_link $dot $sys

#===========================================
#Alacritty
#===========================================
mkdir -p $HOME/.config/alacritty

dotAlac="$PWD/alacritty.yml"
sysAlac="$HOME/.config/alacritty/alacritty.yml"
create_link $dotAlac $sysAlac

#===========================================
#Git
#===========================================
mkdir -p $HOME/.config/git

dotGit="$PWD/gitconfig"
sysGit="$HOME/.config/git/config"
create_link $dotGit $sysGit

#===========================================
#Zsh
#===========================================
dotZsh="$PWD/zshrc"
sysZsh="$HOME/.zshrc"
create_link $dotZsh $sysZsh

#===========================================
#Tmux
#===========================================
dotTmux="$PWD/tmux.conf"
sysTmux="$HOME/.tmux.conf"
create_link $dotTmux $sysTmux

echo "Dotfile install complete!"
