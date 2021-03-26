[ -f $HOME/.config/zsh/aliases.zsh ] && source $HOME/.config/zsh/aliases.zsh
[ -f $HOME/.config/zsh/ad-hoc.zsh ] && source $HOME/.config/zsh/ad-hoc.zsh
[ -f $HOME/.config/zsh/languages.zsh ] && source $HOME/.config/zsh/languages.zsh
[ -f $HOME/.config/zsh/prompt.zsh ] && source $HOME/.config/zsh/prompt.zsh
[ -f $HOME/.config/zsh/tools.zsh ] && source $HOME/.config/zsh/tools.zsh

#=================
# General
#=================
export EDITOR='/usr/local/bin/nvim'

# ================
# Homebrew Apple Silicon
# ================
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

#=================
# Secrets
#=================
source ~/.secrets

VETS_PATH=~/workspace/ryan/dotfiles/dept-vets-affairs
if test -f "$VETS_PATH"; then
  source $VETS_PATH
fi

CMS_PATH=~/workspace/ryan/dotfiles/cms
if test -f "$CMS_PATH"; then
  source $CMS_PATH
fi

# ================
# Google Cloud SDK
# ================
export CLOUDSDK_PYTHON="/usr/local/opt/python@3.8/libexec/bin/python"
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
