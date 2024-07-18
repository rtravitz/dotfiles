#!/usr/bin/env bash
set +x
green=$(tput setaf 2)
blue=$(tput setaf 4)
reset=$(tput sgr0)

LINKS=(
  "config/nvim $HOME/.config/nvim dir"
  "config/gh $HOME/.config/gh dir"
  "config/git $HOME/.config/git dir"
  "config/alacritty $HOME/.config/alacritty dir"
  ".bashrc $HOME/.bashrc"
  ".inputrc $HOME/.inputrc"
  ".bash_profile $HOME/.bash_profile"
  ".tmux.conf $HOME/.tmux.conf"
  ".npmrc $HOME/.npmrc"
)

MAC_LINKS=(
  ".zshrc $HOME/.zshrc"
  "ryan.zsh-theme $HOME/.oh-my-zsh/custom/themes/ryan.zsh-theme"
)

create_link() {
  # The linter wants to split robustly with mapfile or read -a,
  # but just letting the shell split into the array here is fine 
  # shellcheck disable=SC2206
  args=($1)
  dotfiles_path=${args[0]}
  system_path=${args[1]}
  is_directory=${args[2]}
  format_string='%-20s➡️   %s\n'

  if [ "$is_directory" == 'dir' ]; then
    format_string="${blue}%-20s${reset}➡️   ${blue}%s${reset}\n"
  fi

  # The double quotes are important in the format string
  # to keep it from lopping off spaces.
  # Additionally, the two paths can't be in double quotes
  # because they'll be concatenated into one argument.
  # shellcheck disable=SC2059,SC2086
  printf "$format_string" $dotfiles_path $system_path

  # link requires absolute path
  # shellcheck disable=SC2086
  ln -sfn "$PWD/$dotfiles_path" $system_path
}

print_success() {
  echo -e "$green$1$reset"
}

print_title() {
  printf "%*s\n" '60' '' | sed 's/ /-/g'
  print_success "$1"
}

loop_links() {
  for ((i = 0; i < ${#LINKS[@]}; i++))
  do
    create_link "${LINKS[$i]}"
  done
}

loop_mac_links() {
  for ((i = 0; i < ${#MAC_LINKS[@]}; i++))
  do
    create_link "${MAC_LINKS[$i]}"
  done
}

# Create symlinks, overwriting current
print_title "creating directories and symlinks..."
mkdir -p "$HOME/.config"
loop_links

if [[ "$OSTYPE" == "darwin"* ]]; then
  loop_mac_links
fi

