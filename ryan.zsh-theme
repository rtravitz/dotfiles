# Modified ZSH Theme emulating the Fish shell's default prompt.

_fishy_collapsed_wd() {
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

local user_color='yellow'; [ $UID -eq 0 ] && user_color='red'
PROMPT="\$(dashed_line)"
PROMPT+='%{$fg[$user_color]%}$(_fishy_collapsed_wd)%{$reset_color%}%(!.#.>) '

