### Link script
- Directories need to be linked individually and the `.config` directory already exists at the users home. `ln -sn config/nvim /home/ryan/.config/nvim` is an example of what would work.

### Packages
delta - install from cargo or use dpkg to install from project releases page
bat - `sudo apt install bat` but installs at batcat. Need to alias to bat.
fd - `sudo apt install fd-find` but installs as fdfind. Need to alias to fd.
fzf - `sudo apt install fzf`
jq - `sudo apt install jq`
ripgrep `sudo apt install ripgrep`
alacritty - build from source
neovim - download from releases page

### bashrc
fzf needs to have its keybindings sourced from a different location

