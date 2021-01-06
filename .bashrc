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

# bash completions
source '/usr/local/etc/bash_completion.d/git-completion.bash'

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

source ~/core.sh

# ================
# FZF
# ================

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

