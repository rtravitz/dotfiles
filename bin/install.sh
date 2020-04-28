#!/usr/bin/env bash

# grab lines from packages.txt that don't start with a '#'
# and are not blank and brew install each of them
cat packages.txt | grep -Ev '(^#|^$)' | xargs -I % brew install %
echo '🛠️ install script complete'

