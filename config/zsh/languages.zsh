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
# Java
#=================
SET_JAVA_HOME_PATH="$HOME/.asdf/plugins/java/set-java-home.zsh"
if test -f "$SET_JAVA_HOME_PATH"; then
  . $SET_JAVA_HOME_PATH
fi
