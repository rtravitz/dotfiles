#=================
# ZSH
#=================
export ZSH="/Users/rtravitz/.oh-my-zsh"
ZSH_THEME="lambda"

#=================
# Plugins
#=================
plugins=(
  git
  colored-man-pages
  colorize
  docker
)

source $ZSH/oh-my-zsh.sh

#=================
# Aliases
#=================
alias tmn='tmux new -s'
alias tma='tmux attach -t'
alias zs='source ~/.zshrc'
alias lab='cd ~/workspace/lab'
alias zshrc='nvim ~/.zshrc'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias alac='nvim ~/.config/alacritty/alacritty.yml'
alias dotfiles='cd ~/workspace/dotfiles'

#=================
# Go
#=================
export GOROOT=/usr/local/go
export GOPATH=~/gocode
export PATH=$PATH:$GOPATH/bin

#=================
# Rust
#=================
export PATH=$PATH:/Users/rtravitz/.cargo/bin


#=================
# Secrets
#=================
source ~/.secrets
