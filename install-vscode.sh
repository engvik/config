#!/bin/bash

# TODO: Install vscode

mkdir -p ~/.config/Code/User
cp dotfiles/vscode.json ~/.config/Code/User/settings.json

xargs -L1 code --install-extension < dotfiles/vscode-extensions

