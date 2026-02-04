#!/usr/bin/env bash

install() {
  echo $1 | xargs sudo pacman -S --noconfirm
}

# Utilities
install "
  bash-completion 
  bat 
  clang 
  fd 
  fzf 
  git 
  git-delta 
  github-cli 
  jq 
  less 
  less 
  ripgrep 
  tmux 
  unzip 
  which
"

# Apps
install "
  firefox
  ghostty
  spotify-launcher
  flameshot
"

# Hyprland
install " 
  hyprpaper 
  hyprlock
"

# Bluetooth
install " 
  bluez 
  bluez-utils 
  bluetui 
  blueman 
"

# Audio
install " 
  pipewire 
  pipewire-audio 
  pipewire-pulse 
  pipewire-alsa 
  wireplumber 
  playerctl 
  pavucontrol
"

# Secure Boot
install " 
  sbctl
"

# Network
install " 
  networkmanager
"

# Waybar
install " 
  waybar 
  ttf-nerd-fonts-symbols 
"

