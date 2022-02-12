[ -f $HOME/.config/zsh/aliases.zsh ] && source $HOME/.config/zsh/aliases.zsh
[ -f $HOME/.config/zsh/languages.zsh ] && source $HOME/.config/zsh/languages.zsh
[ -f $HOME/.config/zsh/prompt.zsh ] && source $HOME/.config/zsh/prompt.zsh
[ -f $HOME/.config/zsh/tools.zsh ] && source $HOME/.config/zsh/tools.zsh

#=================
# General
#=================
export EDITOR='/usr/local/bin/nvim'

# Add bin for user
export PATH="$HOME/bin:$PATH"

#=================
# Secrets
#=================
source ~/.secrets

