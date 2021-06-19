
"=====================
filetype plugin indent on
set encoding=utf-8
"set nocompatible
syntax enable

if has('nvim')
	"NVim block
  set termguicolors
else
	"Vim block
endif

"reload file if chenge outside
set autoread

set visualbell

set scrolloff=2

set ruler number relativenumber cursorline

set expandtab tabstop=2 autoindent softtabstop=2 shiftwidth=2

set showcmd wildmenu

set hlsearch incsearch

set wrap linebreak nolist textwidth=80

set ttimeoutlen=10
let &t_SI.="\e[5 q" 
let &t_SR.="\e[3 q"
let &t_EI.="\e[2 q"

if has('nvim')
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    :silent !wget -P ~/.local/share/nvim/site/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    :silent !wget -P ~/.vim/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif
endif


" Plugins
if has('nvim')
	"NVim block
    call plug#begin()
else
	"Vim block
    call plug#begin('~/.vim/plugged')
endif
"autocomplit
Plug 'dracula/vim', {'name': 'dracula'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeTogle'}
Plug 'vim-airline/vim-airline' 
Plug 'airblade/vim-gitgutter'
Plug 'stephpy/vim-yaml', {'for': 'yaml'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c','cpp']}
Plug 'rhysd/vim-clang-format'
Plug 'vim-scripts/DoxyGen-Syntax'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'pboettch/vim-cmake-syntax'
Plug 'rip-rip/clang_complete'
call plug#end()

if has('nvim')
    if empty(glob("~/.config/nvim/plugged/vim-airline/autoload/airline.vim"))   
      :PlugInstall
  endif
else
  if empty(glob("~/.vim/plugged/vim-airline/autoload/airline.vim"))   
      :PlugInstall
  endif
endif

let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 1 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0 "Про это позже расскажу


colorscheme dracula
map <C-n> :NERDTreeToggle
