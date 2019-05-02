#!/bin/bash

# Get neovim

if ! [ -x "$(command -v nvim)" ]; then
    sudo apt install neovim
fi

# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copy config
mkdir -p ~/.config/nvim
cp dotfiles/init.vim ~/.config/nvim/init.vim

# Install plugins
nvim +PlugInstall +UpdateRemotePlugins +qa
