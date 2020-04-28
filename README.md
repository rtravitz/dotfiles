# Dotfiles

This repo holds my configuration files for some of my frequently used tools:
* [Neovim](https://neovim.io/)
* [Tmux](https://github.com/tmux/tmux)
* [Alacritty](https://github.com/jwilm/alacritty)
* [Git](https://git-scm.com/)
* [Bash](https://www.gnu.org/software/bash/)

Executing `bin/link.sh` from within the project directory will symlink its contents to the appropriate locations on OSX.
*Beware*: The symlink uses -f and will overwrite any file or directory currently at the destination.

Executing `bin/install.sh` from the root of the dotfiles directory will brew install packages found in packages.txt.
