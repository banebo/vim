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
echo "[*] Installing vim-pathogen ... "
git clone https://github.com/tpope/vim-pathogen $HOME/vim-pathogen
if [[ ! -d $HOME/.vim/autoload ]]; then
mkdir $HOME/.vim/autoload
fi
cp -r $HOME/vim-pathogen/autoload/* $HOME/.vim/autoload/
rm -rf $HOME/vim-pathogen
echo "    [+] Done"

# flake8 install
type flake8 > /dev/null
if [[ $? -ne 0 ]]; then
    type pacman > /dev/null
    if [[ $? -eq 0 ]]; then
        sudo pacman -S flake8
    else
        sudo apt-get install flake8
    fi
    echo "[+] Flake8 installed!"
fi

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
git clone https://github.com/w0rp/ale.git $HOME/.vim/bundle/ale
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
