#!/usr/bin/env bash

set -e

green=$(tput setaf 2)
reset=$(tput sgr0)

name="nvim-linux-x86_64"
tar_name="$name.tar.gz"

latest_json=$(curl -s 'https://api.github.com/repos/neovim/neovim/releases/latest') 
version_tag=$(jq -r '.tag_name' <<< "$latest_json")
download_link=$(jq -r --arg name "$tar_name" '.assets[] | select(.name == $name) | .browser_download_url' <<< "$latest_json")

tools_dir="$HOME/dev/tools" 
echo "Moving to $tools_dir"
mkdir -p "$tools_dir"
cd $tools_dir

echo "Downloading neovim version $version_tag"
wget -q $download_link

if [ -d "$name" ]; then
  temp_name="$name-OLD"
  echo "Setting old version aside to $temp_name"
  mv $name $temp_name
fi

echo "Extracting files"
tar xzf "$tar_name"

echo "Removing $temp_name and $tar_name"
rm -rf "$temp_name"
rm "$tar_name"

echo "$green✅ Successfully updated to neovim $version_tag!$reset"
