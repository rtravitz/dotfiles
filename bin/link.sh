#!/usr/bin/env bash
set +x

create_link() {
  printf '%-20s ➡️ %-30s\n' $1 $2
  # link requires absolute path
  ln -sfh "$PWD/$1" $2
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
print_title 'config'
#===========================================
dot="config"
sys="$HOME/.config"
create_link $dot $sys

#===========================================
print_title 'zsh'
#===========================================
dot=".zshrc"
sys="$HOME/.zshrc"
create_link $dot $sys

dot="ryan.zsh-theme"
sys="$HOME/.oh-my-zsh/custom/themes/ryan.zsh-theme"
create_link $dot $sys

#===========================================
print_title 'tmux'
#===========================================
dot=".tmux.conf"
sys="$HOME/.tmux.conf"
create_link $dot $sys

#===========================================
print_title 'asdf'
#===========================================
dot=".tool-versions"
sys="$HOME/.tool-versions"
create_link $dot $sys

print_success "\n✅ dotfile install complete!"

