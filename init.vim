"===========================================================================
" THE BEER-WARE LICENSE
" Sam4uk wrote this file. As long as you retain this notice you can do
" whatever you want with this stuff. If we meet some day, and you think this
" stuff is worth it, you can buy me a beer in return
"                                                    19-06-21
"                                                            Sam4uk
"===========================================================================
"---------------------------------------------------------------------------
"                 C O N F I G   B E G I N
"---------------------------------------------------------------------------
"                 C O M M O N
"---------------------------------------------------------------------------
filetype plugin indent on
set encoding=utf-8
"set nocompatible
syntax enable
if has('nvim')
	"NVim block
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
"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"                 E N D   C O M M O N
if has('nvim')
"---------------------------------------------------------------------------
"                 F O R   N V i m
"---------------------------------------------------------------------------
  set termguicolors
"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"                 E N D   N V i m
else
"---------------------------------------------------------------------------
"                 F O R  V i m
"---------------------------------------------------------------------------
"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"                 E N D  V i m
"---------------------------------------------------------------------------
"                 C H E C K  P L U G  M A N N A G E R
"---------------------------------------------------------------------------
endif
if has('nvim')
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    :silent !wget -P ~/.local/share/nvim/site/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    :silent !wget -P ~/.vim/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif
endif
"---------------------------------------------------------------------------
"                 I N I T  P L U G I N  M A N N A G E R
"---------------------------------------------------------------------------
if has('nvim')
    call plug#begin()
else
    call plug#begin('~/.vim/plugged')
endif
"---------------------------------------------------------------------------
"                 P L U G I N S  L I S T
"---------------------------------------------------------------------------
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'NLKNguyen/papercolor-theme'


Plug 'dracula/vim', {'name': 'dracula'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeTogle'}
Plug 'vim-airline/vim-airline' 
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'chrisbra/vim-zsh'
Plug 'stephpy/vim-yaml', {'for': 'yaml'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c','cpp']}
Plug 'rhysd/vim-clang-format'
Plug 'vim-scripts/DoxyGen-Syntax'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'pboettch/vim-cmake-syntax'
Plug 'rip-rip/clang_complete'
"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"               E N D  P L U G I N  L I S T
"---------------------------------------------------------------------------
call plug#end()
"---------------------------------------------------------------------------
"               T R Y   I N S T A L L  P L U G I N S
"---------------------------------------------------------------------------
if has('nvim')
    if empty(glob("~/.config/nvim/plugged/vim-airline/autoload/airline.vim"))   
      :PlugInstall
  endif
else
  if empty(glob("~/.vim/plugged/vim-airline/autoload/airline.vim"))   
      :PlugInstall
  endif
endif
"---------------------------------------------------------------------------
"                P L U G I N S  C O N F I G
"---------------------------------------------------------------------------
colorscheme ayu
if has('nvim')
"  colorscheme ayu
  let ayucolor="dark"
else
  colorscheme PaperColor
  set background=light
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 1 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 1 "Про это позже расскажу
map <C-n> :NERDTreeToggle
map <C-f> :ClangFormat
"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"                         E O F
