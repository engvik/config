#!/bin/bash

# vim
mkdir -p ~/.config/nvim
cp dotfiles/init.vim ~/.config/nvim/init.vim

# bash
cp dotfiles/.bashrc ~/
cp dotfiles/.bash_aliases ~/
cp dotfiles/.bash_prompt ~/

# git
cp dotfiles/.gitconfig ~/
cp dotfiles/.gitignore ~/

