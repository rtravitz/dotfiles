#!/usr/bin/env bash

# grab lines from packages.txt that don't start with a '#'
# and are not blank and brew install each of them
cat packages-macos.txt | grep -Ev '(^#|^$)' | xargs -n1 brew install
echo '🛠️ install script complete'

