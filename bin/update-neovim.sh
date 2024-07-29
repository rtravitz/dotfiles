#!/usr/bin/env bash

set -e

green=$(tput setaf 2)
reset=$(tput sgr0)

latest_json=$(curl -s 'https://api.github.com/repos/neovim/neovim/releases/latest') 
version_tag=$(jq -r '.tag_name' <<< "$latest_json")
download_link=$(jq -r '.assets[] | select(.name == "nvim-linux64.tar.gz") | .browser_download_url' <<< "$latest_json")

tools_dir="$HOME/dev/tools" 
echo "Moving to $tools_dir"
mkdir -p "$tools_dir"
cd $tools_dir

echo "Downloading neovim version $version_tag"
wget -q $download_link

temp_name="nvim-linux64-OLD"
echo "Setting old version aside to $temp_name"
mv nvim-linux64 $temp_name

tar_name="nvim-linux64.tar.gz"
echo "Extracting files"
tar xzf "$tar_name"

echo "Removing $temp_name and $tar_name"
rm -rf "$temp_name"
rm "$tar_name"

echo "$green✅ Successfully updated to neovim $version_tag!$reset"
