#!/usr/bin/env bash

./bin/install-arch.sh
./bin/link.sh
./bin/update-from-github.sh neovim
./bin/update-from-github.sh asdf

systemctl --user enable pipewire-pulse
