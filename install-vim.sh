#!/bin/bash

# Get neovim

if ! [ -x "$(command -v nvim)" ]; then
    curl -L -o nvim.tar.gz https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
    tar zxf nvim.tar.gz
    sudo mv nvim-linux64/share/* /usr/local/share
    sudo mv nvim-linux64/bin/* /usr/local/bin
    rm -rf nvim-linux64/
    rm nvim.tar.gz
fi

# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copy config
mkdir -p ~/.config/nvim
cp dotfiles/init.vim ~/.config/nvim/init.vim

# Install plugins
nvim +PlugInstall +UpdateRemotePlugins +qa

CUR_PWD=$PWD
cd ~/.local/share/nvim/plugged/tern_for_vim
npm install
cd $CUR_PWD

npm i -g neovim
