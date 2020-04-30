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
# Tools
#=================
alias tmn='tmux new -s'
alias tma='tmux attach -t'
alias tmk='tmux kill-session -t'
alias tml='tmux ls'
alias tmka="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"

alias tmuxconf='nvim ~/.tmux.conf'
alias bs='source ~/.bashrc'
alias bashrc='nvim ~/.bashrc'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias alac='nvim ~/.config/alacritty/alacritty.yml'
alias vbr="git reflog | grep -o \"checkout: moving from .* to \" |\
    sed -e 's/checkout: moving from //' -e 's/ to $//' | head -10 | grep -v 'master'"
alias del-merged='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'

#=================
# Ad Hoc
#=================
HOMEWORK_DIR="$HOME/workspace/adhoc/homework/homework_answers"

alias adhoc="cd $HOME/workspace/adhoc"
alias homework="cd $HOMEWORK_DIR"
alias vslcsp="bash $HOMEWORK_DIR/assignments/slcsp/validate.sh"
alias vproto="cat $HOMEWORK_DIR/assignments/proto/answers"
alias cpproto="cp $HOMEWORK_DIR/assignments/proto/txnlog.dat ."
alias vfetch="diff $HOMEWORK_DIR/assignments/fetch/test/api/managed-record-test.js test/api/managed-record-test.js"

vhhbuild(){
  cp "$HOMEWORK_DIR/assignments/hhbuilder/evaluate.html" evaluate.html
  cp -r "$HOMEWORK_DIR/assignments/hhbuilder/jasmine" jasmine          
  diff -s index.html "$HOMEWORK_DIR/assignments/hhbuilder/index.html"  
  npx es-check es5 index.js 
}

grade_local() {
  grading_dir="$HOME/workspace/adhoc/homework/grading"
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

grade() {
  submission=$1

  grading_dir="$HOME/workspace/adhoc/homework/grading"
  echo "Deleting current grading directory: $grading_dir"
  rm -rf "$grading_dir"

  echo "Making new grading directory: $grading_dir"
  mkdir $grading_dir

  mv ~/Downloads/$submission.zip $grading_dir
  cd $grading_dir

  echo "Unzipping..."
  mkdir $submission
  cd $submission
  unzip ../$submission.zip
  cd ..
  rm $submission.zip

  echo "Copying submission to remote host"
  scp -r $submission homeworkgrading.com:~

  echo "Done!"
}

#=================
# Go
#=================
export GOROOT=/usr/local/go
export GOPATH=~/gocode
export GO111MODULE=on
export PATH=$PATH:$GOPATH/bin

#=================
# Rust
#=================
export PATH="$PATH:$HOME/.cargo/bin"

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
NPM_PACKAGES="$HOME/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"

#=================
# Secrets
#=================
source ~/.secrets

VETS_PATH=~/workspace/ryan/dotfiles/dept-vets-affairs
if test -f "$VETS_PATH"; then
  source $VETS_PATH
fi

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
  --glob "!.npm/*"'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# ================
# Bat
# ================
export BAT_THEME=TwoDark
