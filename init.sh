#! /bin/bash

echo -e "$(cat LICENSE)"

BackUp (){
    echo "BackUp ${1} ${2}"
    mv ${2} ${2}.$(date +%d-%m-%y)
    ln -s ${1} ${2}
}

InitLink (){
    # echo "${1}"
    #  $HOME/$VIM_DIR
    echo -e "Check existing \e[34m${1}\e[0m ..."
    # Перевіряю існування шляху
    if [ -e ${1} ]; then
        # якщо шлях існує
        echo -e "Path found"
        # echo "Path \e[34m${1}\e[0m \e[32mexist\e[0m"
        # перевіряємо чи це не сім лінк
        if [ -L ${1} ]; then
            # це сімлінк
            echo -e "${1} is a symlink"
            echo -e "Read symlink"
            echo -e "${1} => $(readlink ${1})"
            if [ $(readlink ${1}) = "$(pwd)" ];then
                echo -e "\e[32mSymlink OK\e[0m"
            else
                # не наша тека
                BackUp "$(pwd)" "${1}"
                echo -e "\e[32mSymlink OK\e[0m"
            fi
        else
            #is not symlink
            echo -e "Try open folder"
            # перевіряємо чи не каталог
            if [ -d ${1} ]; then
                # каталог
                echo -e "${1} is a folder"
                BackUp "$(pwd)" "${1}"
                echo -e "\e[32mSymlink OK\e[0m"
            else
                # файл
                echo -e "${1} is a file"
                BackUp "$(pwd)" "${1}"
                echo -e "\e[32mSymlink OK\e[0m"
            fi
        fi
    else
        echo -e "Path ${1} \e[31mno exists\e[0m"
        ln -s "$(pwd)" ${1}
        echo -e "\e[32mCreate\e[0m"
        echo -e "\e[32mSymlink OK\e[0m"
    fi
}

InitLink ~/.vim
InitLink ~/.config/nvim

if [ -e "$(pwd)/vimrc" ]; then
    if [ $(readlink $(pwd)/vimrc) = "$(pwd)/init.vim" ];then
        echo -e "vimrc ok"
    else
        ln -s "$(pwd)/init.vim" "$(pwd)/vimrc"
    fi
else
    ln -s "$(pwd)/init.vim" "$(pwd)/vimrc"
fi

# if [ -e "$HOME/.local/share/nvim/plugged" ]; then
#     if [ -d "$HOME/.local/share/nvim/plugged" ]; then
#         mv "$HOME/.local/share/nvim/plugged" "$HOME/.local/share/nvim/plugged.$(date +%d-%m-%y)"
#         ln -s "$(pwd)/plugged" "$HOME/.local/share/nvim/plugged"
#     else
#         if [ $(readlink "$HOME/.local/share/nvim/plugged") = "$(pwd)/plugged" ];then
#             echo "plugged ok"
#         else
#             ln -s "$(pwd)/plugged" "$HOME/.local/share/nvim/plugged"
#         fi
#     fi
# else
#     ln -s "$(pwd)/plugged" "$HOME/.local/share/nvim/plugged"
# fi