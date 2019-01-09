#!/usr/bin/env bash

read -p "[?] This script will modify the files: .vim and .vimrc ...  Continue [y/n]: "  choice

if [[ $choice != "y" ]]; then
    echo
    echo "[-] Exiting... "
    exit 1
fi

if [[ ! -d $HOME/.vim ]]; then
    echo "[*] Creating ~/.vim ... Reason: dir does not exist"
    mkdir ~/.vim
fi

if [[ ! -d $HOME/.vim/bundle/ ]]; then
    echo "[*] Creating ~/.vim/bundle ... Reason: dir does not exist"
    mkdir ~/.vim/bundle
fi

echo
echo "[*] Running apt-get install vim-pathogen ... "
sudo apt-get install vim-pathogen -y
echo "    [+] Done"

echo
echo "[*] Running apt-get install flake8 ..."
sudo apt-get install flake8 -y
echo "    [+] Done"

echo
echo "[*] Setting up .vimrc ..."
if [[ ! -f $HOME/vim/.vimrc ]]; then
    echo "[-] Missing file: vim/.vimrc from https://github.com/banebo/vim.git repo... Exiting..."
    exit 1
fi
cp $HOME/vim/.vimrc $HOME/.vimrc
echo "    [+] Done"

echo
echo "[*] Setting up vim bundles..."
echo
git clone https://github.com/w0rp/ale.git $HOME.vim/bundle/ale
echo "    [+] Ale from https://github.com/w0rp/ale.git installed"

echo
git clone https://github.com/dracula/vim.git $HOME/.vim/bundle/dracula
echo "    [+] Dracula-theme from https://github.com/dracula/dracula-theme.git installed"
echo

echo
git clone https://github.com/itchyny/lightline.vim.git $HOME/.vim/bundle/lightline
echo "    [+] Light line from https://github.com/itchyny/lightline.vim.git installed"

echo
git clone https://github.com/scrooloose/nerdtree.git $HOME/.vim/bundle/nerdtree
echo "    [+] NERDTree from https://github.com/scrooloose/nerdtree.git installed"

echo
git clone https://github.com/tpope/vim-eunuch.git $HOME/.vim/bundle/vim-eunuch
echo "    [+] Vim-eunuch from https://github.com/tpope/vim-eunuch.git installed"

echo
git clone https://github.com/itchyny/vim-gitbranch.git $HOME/.vim/bundle/vim-gitbranch
echo "    [+] Vim-gitbranch from https://github.com/itchyny/vim-gitbranch.git installed"

echo
git clone https://github.com/airblade/vim-gitgutter.git $HOME/.vim/bundle/vim-gitgutter
echo "    [+] Vim-gitgutter from https://github.com/airblade/vim-gitgutter.git installed"

echo;echo
echo "[+] All done, exiting..."

exit 0
