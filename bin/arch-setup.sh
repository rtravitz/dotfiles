#!/usr/bin/env bash

# Install
./bin/install-arch.sh
./bin/link.sh
./bin/update-from-github.sh neovim
./bin/update-from-github.sh asdf

# Services
systemctl --user enable --now pipewire-pulse
systemctl enable --now evremap.service
systemctl enable --now bluetooth.service
systemctl enable --now tailscaled
