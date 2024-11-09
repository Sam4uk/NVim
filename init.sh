sh -c "$(wget https://raw.githubusercontent.com/Sam4uk/deputy/refs/heads/master/deputy -O -)" --  $(pwd) ~/.vim
ln -s "$(pwd)/init.vim" "$(pwd)/vimrc"
sh -c "$(wget https://raw.githubusercontent.com/Sam4uk/deputy/refs/heads/master/deputy -O -)" --  $(pwd) ~/.config/nvim