#! /bin/bash

cat LICENSE


echo "Check existing $HOME/.vim dir"
if [[ -d $HOME/.vim ]]
then
    echo "$HOME/.vim exists on your filesystem."
else
    echo "$HOME/.vim not exists on your filesystem."
    mkdir -p $HOME/.vim 
    echo "$HOME/.vim is crated on your files system."
fi
echo "Check existing $HOME/.vim/vimrc file"
if [[ -f $HOME/.vim/vimrc ]]
then
    echo "$HOME/.vim/vimrc exists on your filesystem."
    echo "Make backup file $(date +%d-%m-%y)"
    mv $HOME/.vim/vimrc $HOME/.vim/vimrc.back.$(date +%d-%m-%y)
else
    echo "Make $HOME/.vim/vimrc symlink to $(pwd)/init.vim"
    ln -s $(pwd)/init.vim   $HOME/.vim/vimrc
fi

echo "Check existing $HOME/.config/nvim/ dir"
if [[ -d $HOME/.config/nvim/ ]]
then
    echo "$HOME/.config/nvim/ exists on your filesystem."
else
    echo "$HOME/.config/nvim/ not exists on your filesystem."
    mkdir -p $HOME/.config/nvim/ 
    echo "$HOME/.config/nvim/ is crated on your files system."
fi
echo "Check existing $HOME/.config/nvim/init.vim file"
if [[ -f $HOME/.config/nvim/init.vim ]]
then
    echo "$HOME/.config/nvim/init.vim exists on your filesystem."
    echo "Make backup file $(date +%d-%m-%y)"
    mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/init.vim.back.$(date +%d-%m-%y)
else
    echo "Make $HOME/.config/nvim/init.vim symlink to $(pwd)/init.vim"
    ln -s $(pwd)/init.vim   $HOME/.config/nvim/init.vim
fi



# echo "redy"
# VIM_DIR=$HOME/.vim/vimrc
# NVIM_DIR=$HOME/.config/nvim/init.vim

# if
    # mkdir $HOME/.vim
# fi
    # ln -s $(pwd)/init.vim   $HOME/.vim/vimrc
    # ln -s $(pwd)/init.vim   $HOME/.config/nvim/init.vim