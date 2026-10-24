#!/usr/bin/env bash

install() {
  echo $1 | xargs sudo pacman -S --noconfirm
}

# Utilities
install "
  bash-completion 
  base-devel
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
  man-db
  man-pages
  tailscaled
"

# Apps
install "
  firefox
  ghostty
  spotify-launcher
  flameshot
  nwg-look
"

# Hyprland
install " 
  hyprpaper 
  hyprlock
"

# Files
install "
  thunar
  tumbler
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
  wireguard-tools 
  systemd-resolvconf
"

# Waybar
install " 
  waybar 
  ttf-nerd-fonts-symbols 
"

