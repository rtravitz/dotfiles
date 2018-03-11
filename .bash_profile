#==========================================
#Rails
#==========================================
alias nuke="rake db:drop db:create db:migrate db:seed"

#==========================================
#Go
#==========================================
export GOROOT=/usr/local/go
export GOPATH=~/gocode
export PATH=$PATH:$GOPATH/bin
alias gocode="cd ~/gocode/src/github.com/rtravitz"
alias gta="go test ./... -v"

#==========================================
#Git
#==========================================
alias lola="git log --graph --format=format:\"%C(auto)%h %C(green)%cD %C(blue)%aN%Creset %s\""

#==========================================
#Turing
#==========================================
alias m1="cd ~/turing/module1"
alias m2="cd ~/turing/module2"
alias m3="cd ~/turing/module3"
alias m4="cd ~/turing/module4"
alias tur="cd ~/turing"

#==========================================
#Shell Prompt
#==========================================
PS1="\h\w:$(git branch 2>/dev/null | grep '^*' | colrm 1 2)$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PS1="\033[1;33m\]\W\[\033[0;34m\]\$(parse_git_branch)\[\033[0;33m\] ➟ \e[m"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#==========================================
#Secrets
#==========================================
source ~/.bash_secrets

