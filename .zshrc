#=================
# ZSH
#=================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="ryan"

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

source ~/.shellrc

# ================
# FZF
# ================

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. /opt/homebrew/opt/asdf/asdf.sh

