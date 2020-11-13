#!/bin/sh

if [[ $EUID -ne 0 ]]; then
    echo "This must be run a root"
    exit 1
fi

pacman -S neovim neofetch alacritty htop git zsh python3 golang npm nodejs
RESULT=$?

if [ $RESULT  -ne 0 ]; then
    echo "Installing a package failed exiting"
    exit 2
fi

pip3 install jedi

# Setting up the different configs
mkdir -r $HOME/.config/alacritty; cp $(pwd)/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
mkdir -r $HOME/.i3; cp $(pwd)/i3/ $HOME/.i3/config
mkdir -r $HOME/.config/nvim; cp $(pwd)/nvim/{init.vim, themes/*, general/*, vim-plug/*, ftplugin/*, plug-config/*}

# Install Vim-Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugInstall +qall
nvim +CocInstall coc-json coc-python coc-snippets coc-yank coc-highlight coc-git coc-explorer +qall
nvim +CocInstall coc-eslint coc-emmet coc-cssmodules coc-calc coc-actions coc-sh coc-python coc-markdownlint +qall
nvim +CocInstall coc-json coc-go coc-css coc-cmake coc-clangd +qall

echo "Checking all files"
# TODO 
