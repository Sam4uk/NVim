wget "https://raw.githubusercontent.com/Sam4uk/deputy/refs/heads/master/deputy" -O "./deputy"

chmod +x "./deputy"

"./deputy" "$(pwd)" "$HOME/.vim" 
"./deputy" "$(pwd)/init.vim" "$(pwd)/vimrc"
"./deputy" "$(pwd)" "$HOME/.config/nvim"

rm "./deputy"