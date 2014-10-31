#!/bin/bash

# Copy powerline font
if [ ! -d "~/.fonts" ]; then
  mkdir ~/.fonts
fi

if [ ! -e "~/.fonts/Droid\ Sans\ Mono\ for\ Powerline.otf" ]; then
   wget -P ~/.fonts/ https://github.com/Lokaltog/powerline-fonts/raw/master/DroidSansMono/Droid%20Sans%20Mono%20for%20Powerline.otf
   fc-cache -vf ~/.fonts
fi

# install pathogen
wget -P ~/.vim/autoload https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim 

# install plugins in pathogen bundle directory
git clone http://github.com/sjl/gundo.vim.git ~/.vim/bundle/gundo
git clone git://github.com/tpope/vim-surround.git ~/.vim/bundle/vim-surround
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/Lokaltog/vim-easymotion.git ~/.vim/bundle/vim-easymotion
git clone https://github.com/flazz/vim-colorschemes.git ~/.vim/bundle/colorschemes
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone https://github.com/corntrace/bufexplorer.git ~/.vim/bundle/bufexplorer
git clone https://github.com/vim-scripts/FuzzyFinder.git ~/.vim/bundle/fuf
git clone https://github.com/vim-scripts/L9.git ~/.vim/bundle/l9
git clone https://github.com/vim-scripts/xptemplate.git ~/.vim/bundle/xptemplate
git clone https://github.com/derekwyatt/vim-scala.git ~/.vim/bundle/vim-scala
git clone https://github.com/vim-scripts/AutoTag.git ~/.vim/bundle/autotag
git clone https://github.com/vlaadbrain/gnuplot.vim.git ~/.vim/bundle/vim-gnuplot
git clone https://github.com/jcf/vim-latex ~/.vim/bundle/vim-latex
git clone https://github.com/tclem/vim-arduino.git ~/.vim/bundle/vim-arduino
git clone https://github.com/vim-scripts/DirDiff.vim.git ~/.vim/bundle/DirDiff
git clone https://github.com/Lokaltog/powerline.git ~/.vim/bundle/powerline
git clone https://github.com/vim-scripts/pmd.vim.git ~/.vim/bundle/vim-pmd
git clone https://github.com/chrisbra/csv.vim.git ~/.vim/bundle/csv
git clone https://github.com/godlygeek/tabular.git ~/.vim/bundle/tabular
git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
git clone https://github.com/Shougo/neocomplcache.vim.git ~/.vim/bundle/neocomplcach

# add symlink to vimrc
ln -s ~/.vim/vimrc ~/.vimrc

