#=================
# Prompt
#=================
collapsed_wd() {
  echo $(pwd | perl -pe '
   BEGIN {
      binmode STDIN,  ":encoding(UTF-8)";
      binmode STDOUT, ":encoding(UTF-8)";
   }; s|^$ENV{HOME}|~|g; s|/([^/.])[^/]*(?=/)|/$1|g; s|/\.([^/])[^/]*(?=/)|/.$1|g
')
}

dashed_line() {
  printf "%*s" $(tput cols) "" | sed "s/ /-/g"
}

# avoid using escape sequences for colors, because they
# may not be portable across terminals. tput generates
# the correct sequences for a terminal.
# http://mywiki.wooledge.org/BashFAQ/053
yellow=$(tput setaf 3)
reset=$(tput sgr0)

PS1="\[$yellow\]\$(collapsed_wd)>\[$reset\] "

#=================
# General
#=================
export EDITOR='/usr/local/bin/nvim'

# bash completions
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# append to the history file, don't overwrite it
shopt -s histappend
# force history to read/write on every command
export PROMPT_COMMAND="history -a; history -n"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
else
  export CLICOLOR=YES
fi

#=================
# Aliases
#=================
alias vi='nvim'
alias vim='nvim'
alias dotfiles='cd ~/workspace/ryan/dotfiles'
alias workspace='cd ~/workspace'
alias lab='cd ~/workspace/ryan/lab'
alias dc='docker-compose'
alias ryan='cd ~/workspace/ryan'
alias today="nvim $HOME/workspace/ryan/today.md"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CaF'
alias gco='git checkout'
alias ibrew='arch -x86_64 /usr/local/bin/brew'
alias tmn='tmux new -s'
alias tma='tmux attach -t'
alias tmk='tmux kill-session -t'
alias tml='tmux ls'
alias tmka="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"
alias tmuxconf='nvim ~/.tmux.conf'
alias bs='source ~/.bash_profile'
alias bashrc='nvim ~/.bashrc'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias alac='nvim ~/.config/alacritty/alacritty.yml'
alias vbr="git reflog | grep -o \"checkout: moving from .* to \" |\
    sed -e 's/checkout: moving from //' -e 's/ to $//' | head -10 | grep -v 'master'"
alias del-merged='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'
alias urldecode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'

# Add bin for user
export PATH="$HOME/bin:$PATH"

#=================
# Ruby
#=================
alias be='bundle exec'
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"

#=================
# Javascript
#=================
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/workspace/tools/.npm-packages/bin:$PATH"

#=================
# Go
#=================
export PATH="$PATH:$HOME/workspace/tools/go/bin"

#=================
# CPP
#=================
export PATH="/usr/local/opt/llvm/bin:$PATH"


# ================
# FZF
# ================

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

export FZF_DEFAULT_COMMAND='rg \
  --files \
  --no-ignore \
  --hidden \
  --follow \
  --glob "!.git/*" \
  --glob "!node_modules/*" \
  --glob "!.npm/*" \
  --glob "!dist/*"'

# ================
# Bat
# ================
export BAT_THEME=TwoDark

# ================
# Homebrew Apple Silicon
# ================
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

# ================
# FZF
# ================

[ -f ~/.fzf.zsh ] && source ~/.fzf.bash

#=================
# Secrets
#=================
[-f ~/.secrets ] && source ~/.secrets

# ================
# ASDF
# ================
. /usr/local/opt/asdf/libexec/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

