#!/usr/bin/env bash
set +x
green=`tput setaf 2`
reset=`tput sgr0`

create_link() {
  printf '%-20s ➡️ %-30s\n' $1 $2
  # link requires absolute path
  ln -sfh "$PWD/$1" $2
}

print_success() {
  echo -e "$green$1$reset"
}

print_title() {
  printf "%*s\n" '60' '' | sed 's/ /-/g'
  echo -e "$green$1$reset"
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
print_title 'bash'
#===========================================
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
print_title 'npm'
#===========================================
dot=".npmrc"
sys="$HOME/.npmrc"
create_link $dot $sys

#===========================================
print_title 'asdf'
#===========================================
dot=".tool-versions"
sys="$HOME/.tool-versions"
create_link $dot $sys

print_success "\n✅ dotfile install complete!"

