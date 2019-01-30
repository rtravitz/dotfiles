#!/usr/bin/env bash

# Create symlinks, overwriting current
echo "Creating directories and symlinks"

mkdir -p $HOME/.config/nvim
ln -sf $PWD/vimrc $HOME/.config/nvim/init.vim

mkdir -p $HOME/.config/alacritty
ln -sf $PWD/alacritty.yml $HOME/.config/alacritty/alacritty.yml

ln -sf $PWD/zshrc $HOME/.zshrc

ln -sf $PWD/tmux.conf $HOME/.tmux.conf

echo "Dotfile install complete"
