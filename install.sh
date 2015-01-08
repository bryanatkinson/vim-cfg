#!/bin/bash

# Copy powerline font
if [ ! -d "~/.fonts" ]; then
  mkdir ~/.fonts
fi

if [ ! -e "~/.fonts/Droid\ Sans\ Mono\ for\ Powerline.otf" ]; then
   wget -P ~/.fonts/ https://github.com/Lokaltog/powerline-fonts/raw/master/DroidSansMono/Droid%20Sans%20Mono%20for%20Powerline.otf
   fc-cache -vf ~/.fonts
fi

# install vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# add symlink to vimrc
ln -s ~/.vim/vimrc ~/.vimrc

# Install plugins
vim +PluginInstall +qall
