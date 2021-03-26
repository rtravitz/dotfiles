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
# FZF
# ================

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f /opt/homebrew/opt/asdf/asdf.sh ] && . /opt/homebrew/opt/asdf/asdf.sh
[ -f /usr/local/opt/asdf/asdf.sh ] && . /usr/local/opt/asdf/asdf.sh
