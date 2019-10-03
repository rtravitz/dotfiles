#!/usr/bin/env bash

create_link() {
  echo -e "Linking $1 -> $2"
  ln -sfF $1 $2
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

dot="$PWD/alacritty.yml"
sys="$HOME/.config/alacritty/alacritty.yml"
create_link $dot $sys

#===========================================
#Git
#===========================================
mkdir -p $HOME/.config/git

dot="$PWD/gitconfig"
sys="$HOME/.config/git/config"
create_link $dot $sys

#===========================================
#Zsh
#===========================================
dot="$PWD/zshrc"
sys="$HOME/.zshrc"
create_link $dot $sys

#===========================================
#Oh My Zsh
#===========================================
dot="$PWD/ryan.zsh-theme"
sys="$HOME/.oh-my-zsh/custom/themes/ryan.zsh-theme"
create_link $dot $sys

#===========================================
#Tmux
#===========================================
dot="$PWD/tmux.conf"
sys="$HOME/.tmux.conf"
create_link $dot $sys

echo "Dotfile install complete!"
