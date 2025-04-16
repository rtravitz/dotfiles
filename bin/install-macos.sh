#!/usr/bin/env bash

if ! type brew > /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install \
  asdf \
  bash \
  bash-completion@2 \
  git \
  git-delta \
  bat \
  fd \
  fzf \
  jq \
  neovim \
  ripgrep \
  tmux

