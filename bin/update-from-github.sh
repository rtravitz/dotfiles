#!/usr/bin/env bash

set -e

GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

TOOLS_DIR="$HOME/dev/tools"
BIN_DIR="$HOME/bin"

fetch_release_info() {
  local name="$1"
  local repo="$2"
  # This tar_name is just a substring that will match the end. The asdf project
  # includes version tags in their filenames, so we just search by the consistent end
  # to avoid having to lookup the version first and then use that to search the full filename.
  local tar_name="$name.tar.gz"
  local latest_json=$(curl -s "https://api.github.com/repos/$repo/releases/latest") 

  version_tag=$(jq -r '.tag_name' <<< "$latest_json")

  local found_asset=$(jq -r --arg name "$tar_name" '.assets[] | select(.name | endswith($name))' <<< "$latest_json")
  download_link=$(jq -r '.browser_download_url' <<< "$found_asset")
  full_tar_name=$(jq -r '.name' <<< "$found_asset")
}

download_and_extract_tar_from_url() {
  echo "Downloading $requested_app version $version_tag"
  wget -q $download_link
  echo "Extracting $full_tar_name"
  tar -xzf "$full_tar_name"
}

requested_app="$1"

case "$requested_app" in
  "neovim")
    # neovim comes with more than just a single binary, so it
    # lives as a whole directory in the tools directory. The neovim
    # directory gets added to the path in .bashrc.
    fetch_release_info "linux-x86_64" "neovim/neovim"
    mkdir -p $TOOLS_DIR
    cd $TOOLS_DIR
    download_and_extract_tar_from_url
    rm "$full_tar_name"
    ;;
  "asdf")
    # asdf comes as a single binary, so it can just be extracted
    # to /tmp and moved to the user's bin directory, which is added to
    # the path for this and other purposes in .bashrc.
    fetch_release_info "linux-amd64" "asdf-vm/asdf"
    cd /tmp
    download_and_extract_tar_from_url

    mkdir -p $BIN_DIR
    mv /tmp/asdf $BIN_DIR
    ;;
  *)
    echo "Please provide a valid software name to update."
    exit 1 
    ;;
esac

echo "$GREEN✅ Successfully updated to $requested_app $version_tag!$RESET"
