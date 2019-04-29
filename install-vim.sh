#!/bin/bash

# Get neovim
sudo apt install neovim

# Install autoload
./vim-autoload.sh

# Copy config
mkdir -p ~/.config/nvim
cp dotfiles/init.vim ~/.config/nvim/init.vim

# Install plugins
nvim +PlugInstall +UpdateRemotePlugins +qa
