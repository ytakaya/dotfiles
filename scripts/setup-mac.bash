#!/usr/bin/env bash
set -x
# shellcheck source=./scripts/common.bash
source "$(dirname "$0")/common.bash"

[ "$(uname)" != "Darwin" ] && exit

# Disable .DS_Store on network disks
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Configure hammerspoon config location
defaults write org.hammerspoon.Hammerspoon MJConfigFile "$XDG_CONFIG_HOME/hammerspoon/init.lua"

# VSCode
VSCODE_SETTING_DIR="$HOME/Library/Application\ Support/Code/User"
rm "$VSCODE_SETTING_DIR/settings.json"
cp "$REPO_DIR/config/vscode/settings.json" "${VSCODE_SETTING_DIR}/settings.json"
# install extention
cat "$REPO_DIR/config/vscode/extensions" | while read line
do
    code --install-extension $line
done
