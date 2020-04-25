#!/usr/bin/env bash
set +x

create_link() {
  printf '%-20s ➡️ %-60s\n' $1 $2
  # link requires absolute path
  ln -sfF "$PWD/$1" $2
}

print_success() {
  echo -e "\e[32m$1\e[0m"
}

print_title() {
  echo '------------------------'
  echo -e "\e[34m$1\e[0m"
}

# Create symlinks, overwriting current
echo "creating directories and symlinks..."
echo "==========================="
#===========================================
print_title 'Neovim'
#===========================================
mkdir -p $HOME/.config/nvim

#after
dot="vim/after"
sys="$HOME/.config/nvim/after"
create_link $dot $sys

#ftdetect
dot="vim/ftdetect"
sys="$HOME/.config/nvim/ftdetect"
create_link $dot $sys

#vimrc
dot="vimrc"
sys="$HOME/.config/nvim/init.vim"
create_link $dot $sys

#===========================================
print_title 'Alacritty'
#===========================================
mkdir -p $HOME/.config/alacritty

dot="alacritty.yml"
sys="$HOME/.config/alacritty/alacritty.yml"
create_link $dot $sys

#===========================================
print_title 'Git'
#===========================================
mkdir -p $HOME/.config/git

dot="gitconfig"
sys="$HOME/.config/git/config"
create_link $dot $sys

#===========================================
print_title 'Bash'
#===========================================
dot="bashrc"
sys="$HOME/.bashrc"
create_link $dot $sys

#===========================================
print_title 'Tmux'
#===========================================
dot="tmux.conf"
sys="$HOME/.tmux.conf"
create_link $dot $sys

print_success "✅ dotfile install complete!"
