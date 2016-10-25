
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

alias m1="cd ~/turing/module1"
alias m2="cd ~/turing/module2"
alias tur="cd ~/turing"

export EDITOR="atom -w"

PS1="🔥 "

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
