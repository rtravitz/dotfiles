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
# General
#=================
alias dotfiles='cd ~/workspace/ryan/dotfiles'
alias workspace='cd ~/workspace'
alias lab='cd ~/workspace/lab'
alias dc='docker-compose'
alias ryan='cd ~/workspace/ryan'

#=================
# Tools
#=================
alias tmn='tmux new -s'
alias tma='tmux attach -t'
alias tmk='tmux kill-session -t'
alias tml='tmux ls'
alias tmka=tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill

alias tmuxconf='nvim ~/.tmux.conf'
alias zs='source ~/.zshrc'
alias zshrc='nvim ~/.zshrc'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias alac='nvim ~/.config/alacritty/alacritty.yml'

#=================
# Ad Hoc
#=================
alias adhoc="cd $HOME/workspace/adhoc"
alias homework="cd $HOME/workspace/adhoc/homework_answers"
alias vslcsp="bash $HOME/workspace/adhoc/homework_answers/assignments/slcsp/validate.sh"

grade() {
  grading_dir="$HOME/workspace/adhoc/grading"
  echo "Deleting current grading directory: $grading_dir"
  rm -rf "$grading_dir"

  echo "Making new grading directory: $grading_dir"
  mkdir $grading_dir

  new_download=$(ls -lt ~/Downloads | tail -n +2 | head -1 | awk '{print $9}')
  echo "Moving $new_download to $grading_dir"
  mv ~/Downloads/$new_download $grading_dir

  echo "Unzipping..."
  cd $grading_dir
  unzip $new_download

  echo "Done!"
}

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
# Ruby
#=================
alias be='bundle exec'

# rbenv
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

#=================
# Javascript
#=================
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#=================
# Secrets
#=================
source ~/.secrets

VETS_PATH=~/workspace/ryan/dotfiles/dept-vets-affairs
if test -f "$VETS_PATH"; then
  source $VETS_PATH
fi

