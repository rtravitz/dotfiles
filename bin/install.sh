#!/usr/bin/env bash

# grab lines from packages.txt that don't start with a '#'
# and brew install each of them
cat packages.txt | awk '/^[^#\s].+/ { print $1 }' | xargs -I % brew install %
echo '🛠️ install script complete'

