#!/bin/sh
rm -rf /home/ubuntu/.vim/bundle

#install pathogen
mkdir -p /home/ubuntu/.vim/autoload /home/ubuntu/.vim/bundle /home/ubuntu/.vim/ftplugin
curl -LSso /home/ubuntu/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

export VIM_DIR=/home/ubuntu/myvim

# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


# install plugins from vim command line
vim -i NONE -c VundleUpdate -c quitall
