#=================
# ZSH
#=================
export ZSH="$HOME/.oh-my-zsh"
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
alias tmk='tmux kill-session -t'
alias tmls='tmux ls'
alias tmka=tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill
alias zs='source ~/.zshrc'
alias lab='cd ~/workspace/lab'
alias zshrc='nvim ~/.zshrc'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias alac='nvim ~/.config/alacritty/alacritty.yml'
alias tmuxconf='nvim ~/.tmux.conf'
alias dotfiles='cd ~/workspace/dotfiles'
alias workspace='cd ~/workspace'

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

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
