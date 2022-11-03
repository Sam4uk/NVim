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
            if [ $(readlink ${1}) = ${2} ];then
                echo -e "\e[32mSymlink OK\e[0m"
            else
                # не наша тека
                BackUp "${2}" "${1}"
                echo -e "\e[32mSymlink OK\e[0m"
            fi
        else
            #is not symlink
            echo -e "Try open folder"
            # перевіряємо чи не каталог
            if [ -d ${1} ]; then
                # каталог
                echo -e "${1} is a folder"
                BackUp "${2}" "${1}"
                echo -e "\e[32mSymlink OK\e[0m"
            else
                # файл
                echo -e "${1} is a file"
                BackUp "${2}" "${1}"
                echo -e "\e[32mSymlink OK\e[0m"
            fi
        fi
    else
        echo -e "Path ${1} \e[31mno exists\e[0m"
        ln -s ${2} ${1}
        echo -e "\e[32mCreate\e[0m"
        echo -e "\e[32mSymlink OK\e[0m"
    fi
}

InitLink ~/.vimrc $(pwd)/vim.config
InitLink ~/.config/nvim/init.vim $(pwd)/vim.config
