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

# avoid using escape sequences for colors, because they
# may not be portable across terminals. tput generates
# the correct sequences for a terminal.
# http://mywiki.wooledge.org/BashFAQ/053
# tput error on linux startup: https://unix.stackexchange.com/questions/208982/tput-no-value-for-term-and-no-t-specified
if [ -t 1 ]; then
  yellow=$(tput setaf 3)
  reset=$(tput sgr0)
fi

PS1="\[$yellow\]\$(collapsed_wd)>\[$reset\] "

NVIM_PATH="$(which nvim)"
export EDITOR=$NVIM_PATH

#=================
# OS Specific
#=================

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias bat='batcat'
  alias fd='fdfind'

  # Neovim installation
  export PATH="$PATH:$HOME/dev/tools/nvim-linux64/bin"

  # ASDF
  export ASDF_DATA_DIR="/home/ryan/.asdf"
  export PATH="$ASDF_DATA_DIR/shims:$PATH"
  . "$HOME/dev/tools/asdf/completions/asdf.bash"

elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias ibrew='arch -x86_64 /usr/local/bin/brew'
  
  # Homebrew Apple Silicon
  export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

  # ASDF
  export ASDF_DATA_DIR="/Users/ryan/.asdf"
  export PATH="$ASDF_DATA_DIR/shims:$PATH"

  # Bash Completions
  # https://docs.brew.sh/Shell-Completion
  if type brew &>/dev/null
  then
    HOMEBREW_PREFIX="$(brew --prefix)"
    if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
    then
      source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    else
      for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
      do
        [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
      done
    fi
  fi
fi

#=================
# General
#=================

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
alias dotfiles='cd ~/dev/dotfiles'
alias workspace='cd ~/workspace'
alias dc='docker-compose'
alias todo="nvim $HOME/notes/todo.md"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CaF'
alias gco='git checkout'
alias tmn='tmux new -s'
alias tma='tmux attach -t'
alias tmk='tmux kill-session -t'
alias tml='tmux ls'
alias tmka="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"
alias tmuxconf='nvim ~/.tmux.conf'
alias bs='source ~/.bash_profile'
alias bashrc='nvim ~/.bashrc'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias alac='nvim ~/.config/alacritty/alacritty.toml'
alias gty='nvim ~/.config/ghostty/config'
alias vbr="git reflog | grep -o \"checkout: moving from .* to \" |\
    sed -e 's/checkout: moving from //' -e 's/ to $//' | head -10 | grep -v 'master'"
alias del-merged='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'
alias urldecode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'
alias cnotes='cd ~/notes'
alias cdev='cd ~/dev'

# Add bin for user
export PATH="$HOME/bin:$PATH"

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

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# ================
# Bat
# ================
export BAT_THEME=TwoDark

#=================
# Secrets
#=================
[ -f ~/.secrets ] && source ~/.secrets

