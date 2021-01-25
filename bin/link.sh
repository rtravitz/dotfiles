#!/usr/bin/env bash
set +x

# run any builds with ninja to populate bin
ninja

create_link() {
  printf '%-20s ➡️ %-30s\n' $1 $2
  # link requires absolute path
  ln -sf "$PWD/$1" $2
}

print_success() {
  echo -e "\e[32m$1\e[0m"
}

print_title() {
  printf "%*s\n" '60' '' | sed 's/ /-/g'
  echo -e "\e[34m$1\e[0m"
}

# Create symlinks, overwriting current
echo "creating directories and symlinks..."

#===========================================
print_title 'Bin'
#===========================================
#container id
dot="bin/cid"
sys="/usr/local/bin/cid"
create_link $dot $sys

#todos
dot="bin/todos"
sys="/usr/local/bin/todos"
create_link $dot $sys

#===========================================
print_title 'Neovim'
#===========================================
#ftplugin
mkdir -p $HOME/.config/nvim/after/ftplugin
dot="vim/after/ftplugin"
sys="$HOME/.config/nvim/after/ftplugin"
for ft in $(ls vim/after/ftplugin | xargs) 
do
  create_link "$dot/$ft" "$sys/$ft"
done

#ftdetect
mkdir -p $HOME/.config/nvim/ftdetect
dot="vim/ftdetect"
sys="$HOME/.config/nvim/ftdetect"
for ft in $(ls vim/ftdetect | xargs) 
do
  create_link "$dot/$ft" "$sys/$ft"
done

#vimrc
dot="init.vim"
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

dot=".gitconfig"
sys="$HOME/.config/git/config"
create_link $dot $sys

#===========================================
print_title 'Shells'
#===========================================
dot=".shellrc"
sys="$HOME/.shellrc"
create_link $dot $sys

dot=".bashrc"
sys="$HOME/.bashrc"
create_link $dot $sys

dot=".inputrc"
sys="$HOME/.inputrc"
create_link $dot $sys

# add .bash_profile on Mac to source ~/.bashrc
os=$(uname -s)
if [[ $os =~ Darwin* ]]; then
  dot=".bash_profile"
  sys="$HOME/.bash_profile"
  create_link $dot $sys
fi

dot=".zshrc"
sys="$HOME/.zshrc"
create_link $dot $sys

dot="ryan.zsh-theme"
sys="$HOME/.oh-my-zsh/custom/themes/ryan.zsh-theme"
create_link $dot $sys

#===========================================
print_title 'Tmux'
#===========================================
dot=".tmux.conf"
sys="$HOME/.tmux.conf"
create_link $dot $sys

#===========================================
print_title 'Github'
#===========================================
mkdir -p $HOME/.config/gh
dot="gh-config.yml"
sys="$HOME/.config/gh/config.yml"
create_link $dot $sys

print_success "\n✅ dotfile install complete!"

