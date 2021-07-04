"╔═══════════════════════════════════════════════════════════════════════════╗
"║ THE BEER-WARE LICENSE                                                     ║
"║ Sam4uk  wrote  this  file.  As long as you retain this notice you  can do ║
"║ whatever you want with this stuff. If we meet some day, and you think this║
"║ stuff is worth it, you can buy me a beer in return                        ║
"║                                                          04-07-21 17:09:12║
"║                                                            Sam4uk         ║
"╚═══════════════════════════════════════════════════════════════════════════╝
"---------------------------------------------------------------------------
"                 C O N F I G   B E G I N
"---------------------------------------------------------------------------
"                 C O M M O N
"---------------------------------------------------------------------------
" вимкнути режим сумісності з класичним редактором Vi
set nocompatible
" задаємо кількість рядків при скролінгу
set scrolloff=4
" (no)wrap динамічний (не)перенос довгих рядків
set wrap
" переносити цілі рядки
set linebreak
"set hidden "
"set mouse=a "
"set mousehide "
" показувати не завершені команди в статус бар
set showcmd wildmenu
" завжди відображати рядок стану
set laststatus=2
" Показуємо лінійку та номерацію рядків відносно поточного рядка 
set ruler number relativenumber cursorline
" Підсвітимо пробіли та табуляцію
set list listchars=tab:>-,trail:-
" мигнути екраном якщо помилка
set visualbell
" Показати ім`я файла в заголовку термінлу 
set title
" змінюємо розмір історії команд та змін
set history=127 undolevels=2048
if has('win32')
  " якщо раптом доведеться запустити вім у вінді
  " НЕ ДАЙ БОГ
  " кодування
  set encoding=cp2151
else
  set encoding=utf-8
  set  termencoding=utf-8
endif
set fileformat=unix
set fencs=utf-8,cp1251,koi8-r,cp866
syntax enable

filetype plugin indent on
" перечити файл якщо змінено ззовні
set autoread
set expandtab tabstop=4 autoindent softtabstop=4 shiftwidth=4 cindent smartindent
au FileType make set tabstop=8 shiftwidth=8
"au FileType markdown set nowrap
set hlsearch incsearch
"set wrap linebreak nolist textwidth=80
set ttimeoutlen=10 "знажуємо затримку виведення помлідовностей
let &t_SI.="\e[5 q" " режим вставки
let &t_SR.="\e[3 q" " режим заміни
let &t_EI.="\e[2 q" " нормальний режим
" де
" 1 - моготливий прямокутник
" 2 - звичайний прямокутник
" 3 - миготливе підкреслення
" 4 - звичайне підкреслення
" 5 - миготлива риска
" 6 - риска
"

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫІЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSSTUVWXYZ,фисвуапршолдьтщзйкыіегмцчня;abcdefghijklmnopqrsstuvwxyz

"ds
"НАСТРОЙКИ СВОРАЧИВАНИЯ БЛОКОВ ТЕКСТА (фолдинг)
set foldenable " включить фолдинг
"set foldmethod=syntax " определять блоки на основе синтаксиса файла
set foldmethod=indent " определять блоки на основе отступов
set foldcolumn=3 " показать полосу для управления сворачиванием
set foldlevel=1 " Первый уровень вложенности открыт, остальные закрыты
set foldopen=all " автоматическое открытие сверток при заходе в них
set tags=tags\ $VIMRUNTIME/systags " искать теги в текущй директории и в указанной (теги генерируются ctags)

function! ConfInfoUpDate()
  call setline(1, '"╔═══════════════════════════════════════════════════════════════════════════╗')
  call setline(2, '"║ THE BEER-WARE LICENSE                                                     ║')
  call setline(3, '"║ Sam4uk  wrote  this  file.  As long as you retain this notice you  can do ║')
  call setline(4, '"║ whatever you want with this stuff. If we meet some day, and you think this║')
  call setline(5, '"║ stuff is worth it, you can buy me a beer in return                        ║')
  call setline(6, '"║                                                          '.strftime("%d-%m-%y %H:%M:%S║"))
  call setline(7, '"║                                                            Sam4uk         ║')
  call setline(8, '"╚═══════════════════════════════════════════════════════════════════════════╝')
endfunction
" автоматично перечитувати конфігурацію при збереженні
autocmd! bufwritepre $MYVIMRC call ConfInfoUpDate()
autocmd! bufwritepost $MYVIMRC source $MYVIMRC
if has('nvim')
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    :silent !wget -P ~/.local/share/nvim/site/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif
  set termguicolors
  call plug#begin()
"  Plug
  Plug 'ayu-theme/ayu-vim' " Кольорова схема
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    :silent !wget -P ~/.vim/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif
  call plug#begin('~/.vim/plugged')
" Plug
  Plug 'NLKNguyen/papercolor-theme'
endif
"---------------------------------------------------------------------------
"                 P L U G I N S  L I S T
"---------------------------------------------------------------------------
"
"https://habr.com/ru/post/468265/
" Іконки 
Plug 'ryanoasis/vim-devicons'

" Plug 'dracula/vim', {'name': 'dracula'} " Кольорова схема
" "Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeTogle'}
Plug 'vim-airline/vim-airline' " Можифікувати рядок статусу
Plug 'airblade/vim-gitgutter' " підсвідка змін gidiff
Plug 'lervag/vimtex', {'for': 'tex'} " LaTeX
Plug 'chrisbra/vim-zsh'
Plug 'stephpy/vim-yaml', {'for': 'yaml'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
" Nodejs
"npm install -g livedown
Plug 'shime/vim-livedown', {'for': 'markdown'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c','cpp']}
Plug 'rhysd/vim-clang-format'
" Plug 'vim-scripts/DoxyGen-Syntax'
" Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'pboettch/vim-cmake-syntax'
Plug 'rip-rip/clang_complete'
"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"               E N D  P L U G I N  L I S T
"---------------------------------------------------------------------------
call plug#end()
"---------------------------------------------------------------------------
"               T R Y   I N S T A L L  P L U G I N S
"---------------------------------------------------------------------------
"
"

"---------------------------------------------------------------------------
"                 I N I T  P L U G I N  M A N N A G E R
"---------------------------------------------------------------------------

if has('nvim')
    if empty(glob("~/.config/nvim/plugged/vim-airline/autoload/airline.vim"))   
    :PlugUpdate
  endif
  colorscheme ayu
  let ayucolor="dark"
else
  if empty(glob("~/.vim/plugged/vim-airline/autoload/airline.vim"))   
      :PlugUpdate
  endif
  colorscheme PaperColor
  set background=light
endif

"---------------------------------------------------------------------------
"                P L U G I N S  C O N F I G
"---------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 1 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 1 "Про это позже расскажу

let g:tex_flavor = 'latex' " LaTeX
let g:vimtex_quickfix_mode = 0 "Отключаем автоматическое открытие окна Quickfix
map <C-n> :NERDTreeToggle
map <C-f> :ClangFormat
"Поменяйте сочетание клавиш на любое вам удобное
nnoremap <leader>ld :LivedownToggle<CR>
"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"                         E O F
