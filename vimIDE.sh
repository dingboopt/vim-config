#!/bin/bash
apt update
set -x
curDir = "$(pwd)"

echo $(curDir)
apt-get install -y git cmake   libncurses5-dev python-dev python3-dev libgtk-3-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev 
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge --with-x --enable-pythoninterp --enable-rubyinterp --enable-luainterp --enable-perlinterp --with-python-config-dir=/usr/lib/python2.7/config/ --enable-gui=gtk2 --enable-cscope --prefix=/usr
make
apt auto-remove -y vim-runtime vim
make install
cd ..
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone https://github.com/dingboopt/vim-config.git

cp vim-config/vimrcVundle -rf ~/.vimrc

vim +PluginInstall +qall

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

cd $(curDir)

cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~/.vim

cp vim-config/vimrc ~/.vimrc
